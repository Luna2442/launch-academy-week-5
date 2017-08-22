require 'pg'

TITLES = ["Roasted Brussels Sprouts",
  "Fresh Brussels Sprouts Soup",
  "Brussels Sprouts with Toasted Breadcrumbs, Parmesan, and Lemon",
  "Cheesy Maple Roasted Brussels Sprouts and Broccoli with Dried Cherries",
  "Hot Cheesy Roasted Brussels Sprout Dip",
  "Pomegranate Roasted Brussels Sprouts with Red Grapes and Farro",
  "Roasted Brussels Sprout and Red Potato Salad",
  "Smoky Buttered Brussels Sprouts",
  "Sweet and Spicy Roasted Brussels Sprouts",
  "Smoky Buttered Brussels Sprouts",
  "Brussels Sprouts and Egg Salad with Hazelnuts"]

#WRITE CODE TO SEED YOUR DATABASE AND TABLES HERE

COMMENTS = [
  {
    comment: "so good",
    recipe_id: 1
  },
  {
    comment: "decent",
    recipe_id: 6
  },
  {
    comment: "so-so",
    recipe_id: 3
  },
  {
    comment: "amaze balls",
    recipe_id: 4
  },
  {
    comment: "okay",
    recipe_id: 1
  },
  {
    comment: "alright",
    recipe_id: 6
  }]

def db_connection
  begin
    connection = PG.connect(dbname: "brussels_sprouts_recipes")
    yield(connection)
  ensure
    connection.close
  end
end

db_connection do |conn|
  TITLES.each do |recipe|
    conn.exec_params("INSERT INTO recipes (recipe) VALUES ($1)", [recipe])
  end
end

db_connection do |conn|
  COMMENTS.each do |comment|
    conn.exec_params("INSERT INTO comments (comment, recipe_id) VALUES ($1, $2)", [comment[:comment], comment[:recipe_id]])
  end
end
