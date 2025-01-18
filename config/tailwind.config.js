module.exports = {
  mode: 'jit',
  content: [
    './app/views/**/*.html.erb', 
    './app/helpers/**/*.rb', 
    './app/javascript/**/*.js',
    './app/assets/**/*.css'
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
