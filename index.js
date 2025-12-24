const express = require('express');
const app = express();

const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.json({ message: 'If this works as expected, this message should be from the EC2 instance!' });
});

app.get('/health', (req, res) => {
  res.status(200).send('OK');
});

let server;

if (require.main === module) {
  server = app.listen(PORT, () => {
    console.log(`App running on port ${PORT}`);
  });
}

module.exports = { app, server };