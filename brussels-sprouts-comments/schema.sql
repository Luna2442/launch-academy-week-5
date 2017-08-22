CREATE TABLE recipes (
  id SERIAL PRIMARY KEY,
  recipe VARCHAR(255) NOT NULL
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  comment VARCHAR(255) NOT NULL,
  recipe_id INT NOT NULL
);

--SELECT * FROM recipes;

--SELECT * FROM comments;

--SELECT recipes.recipe, comments.comment FROM recipes
--JOIN comments ON comments.recipe_id=recipes.id
--WHERE recipes.id = 1;

--SELECT comments.id, recipes.recipe FROM comments
--JOIN recipes ON recipes.id=comments.id
--WHERE comments.id = 3;

--INSERT INTO recipes (recipe) VALUES ('Brussels Sprouts with Goat Cheese');
--INSERT INTO comments (comment, recipe_id) VALUES ('this is good', 4);
--INSERT INTO comments (comment, recipe_id) VALUES ('this is bad', 5);
