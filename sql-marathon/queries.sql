SELECT * FROM movies WHERE year < 2000;
SELECT * FROM categories;
SELECT * FROM movies WHERE id = 4;
SELECT * FROM movies ORDER BY year ASC;
SELECT year, title FROM movies GROUP BY year, title ORDER BY title ASC;
SELECT * FROM movies LIMIT (5);
SELECT * FROM movies ORDER BY id DESC LIMIT (5);
UPDATE categories SET category = 'Science Fiction' WHERE id = 5;
DELETE FROM movies WHERE id=3;
SELECT movies.title, categories.category FROM MOVIES
JOIN categories ON movies.category_id = categories.id
ORDER BY movies.title ASC;
