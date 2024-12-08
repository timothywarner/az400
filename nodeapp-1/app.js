const config = require('./config');
const express = require('express');
const path = require('path');
const { engine } = require('express-handlebars');

const index = require('./routes/index');
const who = require('./routes/who');
const contact = require('./routes/contact');

const app = express();

// Set the directory where the view templates are located
app.set('views', path.join(__dirname, 'views'));

// Initialize and set the view engine to handlebars using express-handlebars
app.engine('handlebars', engine({ defaultLayout: 'main' }));
app.set('view engine', 'handlebars');

// Set the port from the configuration
app.set('port', config.port);

// Middleware to serve static files from the 'public' directory
app.use('/', express.static('public'));

// Route middleware
app.use('/', index);
app.use('/who', who);
app.use('/contact', contact);

// Start the server
app.listen(app.get('port'), () => {
  console.log(`Server running on port ${app.get('port')}`);
});