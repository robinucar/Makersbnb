
def sign_up_user
  visit '/'
  fill_in :email, with: 'testemail@me.com'
  fill_in :password, with: 'pwtest123'
  fill_in :password_confirmation, with: 'pwtest123'

  click_button 'Sign up'
end

def list_property
  fill_in :name, with: 'test_house_name'
  fill_in :description, with: 'pretty_space'
  fill_in :price, with: '100'
  fill_in :available_from, with: '2022/09/30' #PG error if we try '30/09/2022' 
  fill_in :available_until, with: '2022/12/31'
  click_button 'List my Property'
end
