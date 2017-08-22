require "sinatra"
require "pg"
require "pry"

set :bind, '0.0.0.0'  # bind to all interfaces

configure :development do
  set :db_config, { dbname: "movies" }
end

configure :test do
  set :db_config, { dbname: "movies_test" }
end

def db_connection
  begin
    connection = PG.connect(Sinatra::Application.db_config)
    yield(connection)
  ensure
    connection.close
  end
end

get "/" do
  redirect '/movies'
end

get "/actors" do
  @actors = db_connection { |conn| conn.exec("SELECT name,id FROM actors ORDER BY name ASC") }

  erb :'actors/index'
end

get "/actors/:id" do
  @actor_id = params[:id]

  @actor_info = db_connection { |conn| conn.exec(
    "SELECT movies.title, movies.year, movies.rating, actors.name, cast_members.character, cast_members.movie_id FROM movies
      JOIN cast_members ON movies.id = cast_members.movie_id
      JOIN actors ON actors.id = cast_members.actor_id
      WHERE actors.id = '#{@actor_id}'
      ORDER BY movies.rating DESC;"
    )}

  erb :'actors/actor'
end

get "/movies" do
  @movies = db_connection { |conn| conn.exec(
    "SELECT movies.id, movies.title, movies.year, movies.rating, movies.studio_id, genres.name AS genre, studios.name AS studio_name FROM movies
      JOIN studios ON studios.id = movies.studio_id
      JOIN genres ON genres.id = movies.genre_id
      ORDER BY movies.title;"
    )}

  erb :'movies/index'
end

get "/movies/:id" do
  @movie_id = params[:id]

  @movie_info = db_connection { |conn| conn.exec(
    "SELECT movies.title, movies.year, movies.rating, movies.synopsis, movies.studio_id, actors.name AS actor, actors.id AS actor_id, cast_members.character, genres.name AS genre, studios.name AS studio FROM movies
      JOIN cast_members ON movies.id = cast_members.movie_id
      JOIN actors ON actors.id = cast_members.actor_id
      JOIN genres ON genres.id = movies.genre_id
      JOIN studios ON movies.studio_id = studios.id
      WHERE movies.id = '#{@movie_id}'
      ;"
    )}

  erb :'movies/movie'
end
