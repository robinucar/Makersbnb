require 'user'
require 'database_helpers'

describe User do
  describe '.create' do
    it 'should create user' do
      user = User.create(email: "user@test.com", password: "testpass")
      persisted_data = persisted_data(id: user.id, table_name: 'users')

      expect(user).to be_a(User)
      expect(user.id).to eq(persisted_data['id'])
      expect(user.email).to eq "user@test.com"
    end

    it 'should add multiple users' do
      User.create(email: "user1@test.com", password: "testpass1")
      user = User.create(email: "user2@test.com", password: "testpass2")
      User.create(email: "user3@test.com", password: "testpass3")
      persisted_data = persisted_data(id: user.id, table_name: 'users')

      expect(user).to be_a(User)
      expect(user.id).to eq(persisted_data['id'])
      expect(user.email).to eq "user2@test.com"
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(email: 'user@test.com', password: 'testpass')
      result = User.find(id: user.id)
  
      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end
  end

end
