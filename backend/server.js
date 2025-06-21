const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const mysql = require('mysql2/promise');

const app = express();
const PORT = 3001;

app.use(bodyParser.json());
app.use(cors());

const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'joygame',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

app.get('/igre', async (req, res) => {
  const page = parseInt(req.query.page) || 1;
  const limit = parseInt(req.query.limit) || 10;
  const offset = (page - 1) * limit;

  try {
    const [totalResult] = await pool.query('SELECT COUNT(*) as total FROM igre');
    const total = totalResult[0].total;

    const [igre] = await pool.query(
      'SELECT * FROM igre ORDER BY id ASC LIMIT ? OFFSET ?',
      [limit, offset]
    );

    res.json({ total, igre });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});