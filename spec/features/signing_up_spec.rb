feature 'Home page sign in' do 
  scenario 'Signing up by entering details(email, password and confirmation) logs the user in' do 
    visit '/' 
    expect(page).to have_content('Welcome to MakersBnb')

    fill_in :email, with: 'testemail@me.com'
    fill_in :password, with: 'pwtest123'
    fill_in :password_confirmation, with: 'pwtest123'
  
    click_button 'Sign up'

    expect(page).to have_current_path('/properties')
    expect(page).to have_content('Logged in as testemail@me.com')
    
  end


  # below test will be moved into logging in feature test
  scenario 'Clicking login instead of sign up takes you to new user page' do 
    visit '/' 
    expect(page).to have_link 'Login', href: '/sessions/new'

    click_link 'Login'
    expect(page).to have_current_path('/sessions/new')
  end
end