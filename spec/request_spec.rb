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

  describe '.status_update' do
    it 'approves a pending request' do
      request = Request.create(property_id: '1', guest_id: '5', start_date: '2022-01-30', status: 'pending')

      expect { Request.status_update(id: request.id, status: 'approved') }
      .to change { persisted_data(id: request.id, table_name: 'requests')['status'] }
      .from('pending').to('approved')
    end
    
    it 'declines a pending request' do
      request = Request.create(property_id: '1', guest_id: '5', start_date: '2022-01-30', status: 'pending')

      expect { Request.status_update(id: request.id, status: 'declined') }
      .to change { persisted_data(id: request.id, table_name: 'requests')['status'] }
      .from('pending').to('declined')
    end
  end

  describe '.all' do
    it 'returns all requests' do
      request = Request.create(property_id: '1', guest_id: '5', start_date: '2022-01-30', status: 'pending')
      Request.create(property_id: '2', guest_id: '6', start_date: '2022-02-28', status: 'approved')
      requests = Request.all
      p requests

      expect(requests.length).to eq 2
      expect(requests.first).to be_a Request
      expect(requests.first.id).to eq request.id
      expect(requests.first.property_id).to eq '1'
      expect(requests.last.guest_id).to eq "6"
      expect(requests.first.start_date).to eq '2022-01-30'
      expect(requests.last.status).to eq 'approved'
      expect(requests.first.status).to eq 'pending'
      expect(requests.last).to be_a Request
    end          
  end
end
