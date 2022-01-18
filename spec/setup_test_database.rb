require 'pg'

def setup_test_database
  p 'Setting up test database...' 

  connection = PG.connect(dbname: "bnb_app_test")
  #	clear messages table
  connection.exec("TRUNCATE properties;")
end
