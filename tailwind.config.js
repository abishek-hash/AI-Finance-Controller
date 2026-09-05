/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        navy: {
          DEFAULT: '#1e3a5f',
          dark: '#132742',
          light: '#2a4f80',
          50: '#f0f5fa',
          100: '#dce7f2',
          200: '#bdd3e7',
          300: '#8ebadb',
          400: '#5a9bca',
          500: '#3880b6',
          600: '#286699',
          700: '#21527c',
          800: '#1e3a5f',
          900: '#1d3852',
          950: '#132437',
        },
        saarthi: {
          green: '#10b981',
          orange: '#f97316',
          red: '#ef4444',
          light: '#f0f4f8',
          muted: '#64748b',
          dark: '#1e293b',
        },
      },
      boxShadow: {
        'saarthi': '0 4px 24px rgba(0, 0, 0, 0.08)',
        'saarthi-sm': '0 2px 10px rgba(0, 0, 0, 0.05)',
        'saarthi-lg': '0 10px 35px rgba(0, 0, 0, 0.12)',
        'drawer': '-10px 0 30px rgba(0, 0, 0, 0.15)',
      },
      borderRadius: {
        'card': '14px',
      },
      fontFamily: {
        sans: ['Plus Jakarta Sans', 'Inter', 'system-ui', 'sans-serif'],
      },
    },
  },
  plugins: [],
}
