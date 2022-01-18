require 'pg'

class Property
  attr_reader :properties, :id, :description, :price

  def initialize(id:, description:, price:)
    @id = id
    @description = description
    @price = price
  end

  def self.add(description: , price:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect dbname: 'bnb_app_test'
    else 
      connection = PG.connect dbname: 'bnb_app'
    end

    property = connection.exec_params("INSERT INTO properties (description, price) VALUES ($1, $2) RETURNING id, description, price ", [description, price])
    Property.new(id: property[0]["id"], description: property[0]["description"], price: property[0]["price"].to_i)
    # properties
	end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect dbname: 'bnb_app_test'
    else 
      connection = PG.connect dbname: 'bnb_app'
    end

    properties = connection.exec_params("SELECT * FROM properties;")

    #result.map do |bookmark|
      #Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
     #end

    #p 'properties.map: ', 
    properties.map { |property| Property.new(id: property["id"], description: property["description"], price: property["price"]) }
    # ["property_1", "property_2"]
  end
end
