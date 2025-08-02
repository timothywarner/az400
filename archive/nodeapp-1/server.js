// Server entry point for production
const app = require('./app');

const port = process.env.PORT || app.get('port');

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
  console.log(`Environment: ${process.env.NODE_ENV || 'development'}`);
});