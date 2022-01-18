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
end
