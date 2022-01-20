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

  def available_from_formatted
    format_date(@available_from)
  end

  def available_until_formatted
    format_date(@available_until)
  end

  def format_date(date)
    date_array = date.split('-') # date_array = [2022, 10, 01]
    reversed = date_array.reverse # [01, 10, 2022]
    reversed.join('-') # "01-10-2022"
  end

  def self.add(description:, price:, name:, available_from:, available_until: )
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect dbname: 'bnb_app_test'
    else 
      connection = PG.connect dbname: 'bnb_app'
    end

    p available_from
    property = connection.exec_params("INSERT INTO properties (description, price, name, available_from, available_until) VALUES ($1, $2, $3, $4, $5) RETURNING id, description, price, name, available_from, available_until;", [description, price, name, available_from, available_until])
    p property[0]['available_from']
    Property.new(id: property[0]['id'], description: property[0]['description'], price: property[0]['price'], name: property[0]['name'], available_from: property[0]['available_from'], available_until: property[0]['available_until'] )
   
	end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect dbname: 'bnb_app_test'
    else 
      connection = PG.connect dbname: 'bnb_app'
    end

    properties = connection.exec_params("SELECT * FROM properties;")

    properties.map do |property| 
      Property.new(id: property["id"], description: property["description"], price: property["price"], name: property['name'], available_from: property['available_from'], available_until: property['available_until']) 
    end
  end
end
