require 'pg'

class Property
  attr_reader :properties, :id, :description, :price, :name, :available_from, :available_until

  def initialize(id:, description:, price:, name:, available_from:, available_until:)
    @id = id
    @description = description
    @price = price
    @name = name
    @available_from = available_from
    @available_until = available_until
  end

  def self.add(description:, price:, name:, available_from:, available_until: )
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect dbname: 'bnb_app_test'
    else 
      connection = PG.connect dbname: 'bnb_app'
    end

    p property = connection.exec_params("INSERT INTO properties (description, price, name, available_from, available_until) VALUES ($1, $2, $3, $4, $5) RETURNING id, description, price, name, available_from, available_until;", [description, price, name, available_from, available_until])
    p Property.new(id: property[0]["id"], description: property[0]["description"], price: property[0]["price"].to_i, name: property[0]['name'], available_from: [0]['available_from'], available_until: [0]['available_until'])
    # properties
	end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect dbname: 'bnb_app_test'
    else 
      connection = PG.connect dbname: 'bnb_app'
    end

    p properties = connection.exec_params("SELECT * FROM properties;")

    #result.map do |bookmark|
      #Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
     #end

    #p 'properties.map: ', 
    properties.map do |property| 
      Property.new(id: property["id"], description: property["description"], price: property["price"], name: property['name'], available_from: available_from['available_from'], available_until: available_until['available_until']) 
    end
    # ["property_1", "property_2"]
  end
end
