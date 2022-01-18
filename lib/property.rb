require 'pg'

class Property
  attr_reader :properties, :id, :description, :price

  def initialize(id:, description:, price:)
    @id = id
    @description = description
    @price = price
  end

  def self.add(property:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect dbname: 'bnb_app_test'
    else 
      connection = PG.connect dbname: 'bnb_app'
    end

    property = connection.exec_params("INSERT INTO properties (description) VALUES ($1) RETURNING description", [property])
    Property.new(id: property[0]["id"], description: property[0]["description"], price: property[0]["price"])
    # properties
	end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect dbname: 'bnb_app_test'
    else 
      connection = PG.connect dbname: 'bnb_app'
    end

    properties = connection.exec_params("SELECT * FROM properties;")

    #p 'properties.map: ', 
    properties.map { |property| Property.new(id: property[0]["id"], description: property[0]["description"], price: property[0]["price"]) }
    # ["property_1", "property_2"]
  end
end
