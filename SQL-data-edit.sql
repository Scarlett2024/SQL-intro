-- Create a new table
-- In terminal, write: sqlite3 filename.sqlite3
-- In terminal, write: .schema , then the database file shows. 

CREATE TABLE students (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name TEXT,
  last_name TEXT
);

-- Drop the entire students table
DROP TABLE students; 

-- Recreate the entire table
CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT,
    last_name TEXT,
    phone TEXT
);

-- Add a column in the table
-- Common column data types: TEXT, FLOAT, INT, DATE, etc.
ALTER TABLE students ADD COLUMN email TEXT;

-- Drop the phone number column
ALTER TABLE students DROP COLUMN email;

-- Insert a row
INSERT INTO students(first_name, last_name, phone)
VALUES ("Ben", "Block", "111-222-3333");
-- Check out the table
SELECT * FROM students;

-- Update a data cell in a row
UPDATE students
SET phone = "222-333-4444" 
WHERE id = 1;

-- Delete a row from a table
DELETE FROM students
WHERE id = 1;