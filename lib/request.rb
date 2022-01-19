class Request
  attr_reader :id, :property_id, :guest_id, :start_date, :status
  
  def initialize(id:, property_id:, guest_id:, start_date:, status:)
    @id = id  
    @property_id = property_id
    @guest_id = guest_id
    @start_date = start_date
    @status = status
  end

  def self.create(property_id:, guest_id:, start_date:, status:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect dbname: 'bnb_app_test'
    else
      connection = PG.connect dbname: 'bnb_app'
    end
    
    result = connection.exec_params(
    'INSERT INTO requests (property_id, guest_id, start_date, status) VALUES($1, $2, $3, $4)' \
    'RETURNING id, property_id, guest_id, start_date, status;',
    [property_id, guest_id, start_date, status])
    
    Request.new(
      id: result[0]['id'],
      property_id: result[0]['property_id'],
      guest_id: result[0]['guest_id'],
      start_date: result[0]['start_date'],
      status: result[0]['status']
    )
  end

  def self.approve(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect dbname: 'bnb_app_test'
    else
      connection = PG.connect dbname: 'bnb_app'
    end

    result = connection.exec_params(
      "UPDATE requests
      SET status = 'approved'
      WHERE id = $1;",
      [id]
    )

    Request.new(
      id: result[0]['id'],
      property_id: result[0]['property_id'],
      guest_id: result[0]['guest_id'],
      start_date: result[0]['start_date'],
      status: result[0]['status']
    )
  end
end
