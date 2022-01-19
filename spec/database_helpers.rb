require 'pg'

def persisted_data(id:, table_name:)
  connection = PG.connect(dbname: 'bnb_app_test')
  result = connection.query("SELECT * FROM #{table_name} WHERE id = #{id};")
  result.first
end
