require "sinatra"
require "pg"
require "csv"
require "pry"
require_relative "./app/models/article"

set :bind, '0.0.0.0'  # bind to all interfaces
set :views, File.join(File.dirname(__FILE__), "app", "views")

configure :development do
  set :db_config, { dbname: "news_aggregator_development" }
end

configure :test do
  set :db_config, { dbname: "news_aggregator_test" }
end

def db_connection
  begin
    connection = PG.connect(Sinatra::Application.db_config)
    yield(connection)
  ensure
    connection.close
  end
end

# Put your News Aggregator server.rb route code here
set :bind, '0.0.0.0'

get "/" do
  redirect '/articles'
end

get "/articles/new" do
  erb :new
end

get "/articles" do
  @articles = db_connection { |conn| conn.exec("SELECT title, description FROM articles") }

  erb :index
end

post "/articles/new" do
  @article_name = params[:article_title]
  @article_description = params[:article_description]
  @article_url = params[:article_url]

  if @article_name == ""
    @name_error = true
    erb :new
  elsif @article_description == ""
    @description_error = true
    erb :new
  elsif @article_url == ""
    @url_error = true
    erb :new
  else
    db_connection do |conn|
      conn.exec_params("INSERT INTO articles (title, url, description) VALUES ($1, $2, $3)", [params["Title"], params["article_url"], params["article_description"]])
    end
    redirect '/articles'
  end

end
