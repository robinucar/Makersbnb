require 'pg'

def setup_test_database
  p 'Setting up test database...' 

  connection = PG.connect(dbname: "bnb_app_test")
  
  #	clear properties table
  connection.exec("TRUNCATE properties;")

  #	clear users table
  connection.exec("TRUNCATE users;")

  #	clear requests table
  connection.exec("TRUNCATE requests;")
end
