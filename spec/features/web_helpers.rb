
def sign_up_user
    visit '/'
    fill_in :email, with: 'testemail@me.com'
    fill_in :password, with: 'pwtest123'
    fill_in :password_confirmation, with: 'pwtest123'
  
    click_button 'Sign up'
end
