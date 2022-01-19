require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'bnb_app_test')
  result = connection.query("SELECT * FROM properties WHERE id = #{id};")
  result.first 
end 
