require 'pg'

class Property
  attr_reader :properties

  def self.add(property:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect dbname: 'bnb_app_test'
    else 
      connection = PG.connect dbname: 'bnb_app'
    end

    properties = connection.exec_params("INSERT INTO properties (description) VALUES ($1) RETURNING description", [property])

    properties
	end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect dbname: 'bnb_app_test'
    else 
      connection = PG.connect dbname: 'bnb_app'
    end

    properties = connection.exec_params("SELECT * FROM properties;")

    #p 'properties.map: ', 
    properties.map { |property| property['description'] }
    # ["property_1", "property_2"]
  end
end
