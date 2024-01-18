-- Create the students table
-- In terminal, write: sqlite3 filename.sqlite3
-- In terminal, write: .schema , then the database file shows. 

CREATE TABLE students (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name TEXT,
  last_name TEXT
);