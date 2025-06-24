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

  const search = req.query.search || '';
  const genre = req.query.genre || '';

  try {
    // Build WHERE clause based on optional filters
    let whereClauses = [];
    let params = [];

    if (search) {
      whereClauses.push(`(title LIKE ? OR description LIKE ?)`);
      params.push(`%${search}%`, `%${search}%`);
    }

    if (genre) {
      whereClauses.push(`genres LIKE ?`);
      params.push(`%${genre}%`);
    }

    const whereSQL = whereClauses.length > 0 ? `WHERE ${whereClauses.join(' AND ')}` : '';

    // Count total results for pagination
    const [totalResult] = await pool.query(
      `SELECT COUNT(*) as total FROM igre ${whereSQL}`,
      params
    );
    const total = totalResult[0].total;

    // Add LIMIT & OFFSET for paginated results
    const [igre] = await pool.query(
      `SELECT * FROM igre ${whereSQL} ORDER BY id ASC LIMIT ? OFFSET ?`,
      [...params, limit, offset]
    );

    res.json({ total, igre });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

app.post('/dodaj', async (req, res) => {
  const { title, description, releaseDate, genres } = req.body;
  try {
    const [result] = await pool.query(
      'INSERT INTO igre (title, description, year, genres) VALUES (?, ?, ?, ?)',
      [title, description, releaseDate, genres]
    );
    const insertedId = result.insertId;
    const [rows] = await pool.query('SELECT * FROM igre WHERE id = ?', [insertedId]);
    res.status(201).json(rows[0]);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

app.delete('/izbrisi/:id', async (req, res) => {
  const id = parseInt(req.params.id);
  try {
    const [result] = await pool.query('DELETE FROM igre WHERE id = ?', [id]);
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Game not found' });
    }
    res.status(204).send();
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

app.put('/promjeni/:id', async (req, res) => {
  const id = parseInt(req.params.id);
  const { title, description, genres } = req.body;
  try {
    const [result] = await pool.query(
      'UPDATE igre SET title = ?, description = ?, genres = ? WHERE id = ?',
      [title, description, genres, id]
    );
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Book not found' });
    }
    const [rows] = await pool.query('SELECT * FROM igre WHERE id = ?', [id]);
    res.json(rows[0]);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});