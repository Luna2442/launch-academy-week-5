DROP TABLE movies CASCADE;
DROP TABLE categories CASCADE;

CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  year INT NOT NULL,
  category_id INT NOT NULL
);

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  category VARCHAR(255)
);

CREATE UNIQUE INDEX ON categories (category);
CREATE UNIQUE INDEX ON movies (title, year);
