require 'request'
require 'database_helpers'

describe Request do
  describe '.create' do
    it 'creates a request' do
      request = Request.create(property_id: '1', guest_id: '5', start_date: '2022-01-30', status: 'pending')
      persisted_data = persisted_data(id: request.id, table_name: 'requests')

      expect(request).to be_a Request
      expect(request.id).to eq persisted_data['id']
      expect(request.property_id).to eq '1'
      expect(request.guest_id).to eq '5'
      expect(request.start_date).to eq '2022-01-30'
      expect(request.status).to eq 'pending'
    end  
  end

  # Update after .find / .all method.
  describe '.approve' do
    it 'approves a request' do
      request = Request.create(property_id: '1', guest_id: '5', start_date: '2022-01-30', status: 'pending')

      # expect { Request.approve(id: request.id) }.to change { Request.all.first.status }.from('pending').to('approved')
    end
  end

  describe '.decline' do
    it 'declines a request' do
      request = Request.create(property_id: '1', guest_id: '5', start_date: '2022-01-30', status: 'pending')
      
      # expect { Request.decline(id: request.id) }.to change { Request.all.first.status }.from('pending').to('declined')
    end
  end
end
