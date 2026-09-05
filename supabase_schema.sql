-- Settlement Saarthi Database Schema
-- Supabase PostgreSQL tables for merchant settlement reconciliation

-- 1. Transactions Table
CREATE TABLE IF NOT EXISTS transactions (
  order_id TEXT PRIMARY KEY,
  amount NUMERIC(12, 2) NOT NULL,
  refund NUMERIC(12, 2) DEFAULT 0.00,
  fee NUMERIC(12, 2) DEFAULT 0.00,
  settled_amount NUMERIC(12, 2) DEFAULT 0.00,
  status TEXT NOT NULL,
  tax NUMERIC(12, 2),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. Audit Logs Table (Immutable Human Decision Trail)
CREATE TABLE IF NOT EXISTS audit_logs (
  id TEXT PRIMARY KEY,
  timestamp TEXT NOT NULL,
  case_id TEXT NOT NULL,
  order_id TEXT NOT NULL,
  action TEXT NOT NULL,
  user_identifier TEXT NOT NULL,
  previous_status TEXT,
  new_status TEXT NOT NULL,
  details TEXT,
  difference_amount NUMERIC(12, 2) DEFAULT 0.00,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 3. Exception Actions / Cases Table
CREATE TABLE IF NOT EXISTS exception_cases (
  case_id TEXT PRIMARY KEY,
  order_id TEXT REFERENCES transactions(order_id) ON DELETE CASCADE,
  resolution_status TEXT DEFAULT 'Unresolved',
  notes TEXT,
  priority TEXT,
  issue_type TEXT,
  difference NUMERIC(12, 2),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable Row Level Security (RLS)
ALTER TABLE transactions ENABLE ROW LEVEL SECURITY;
ALTER TABLE audit_logs ENABLE ROW LEVEL SECURITY;
ALTER TABLE exception_cases ENABLE ROW LEVEL SECURITY;

-- Allow anonymous access for the hackathon prototype (no auth required)
CREATE POLICY "Allow public read-write for transactions" ON transactions FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Allow public read-write for audit_logs" ON audit_logs FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Allow public read-write for exception_cases" ON exception_cases FOR ALL USING (true) WITH CHECK (true);
