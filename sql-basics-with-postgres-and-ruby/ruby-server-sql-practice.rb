require "sinatra"
require "pg"

set :bind, '0.0.0.0'  # bind to all interfaces

def db_connection
  begin
    connection = PG.connect(dbname: "pets")
    yield(connection)
  ensure
    connection.close
  end
end
