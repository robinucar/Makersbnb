feature 'homepage' do 
  scenario 'has title header' do 
    visit '/' 
    expect(page).to have_content('Welcome to MakersBnb')
  end
  
  scenario 'Entering email address and clicking sign-up takes user to book a space page' do 
    visit '/' 
    fill_in :email, with: 'testemail@me.com'
    fill_in :password, with: 'pwtest123'
    fill_in :password_confirmation, with: 'pwtest123'
  
    click_button 'Sign up'

    expect(page).to have_current_path('/properties')
  end

  scenario 'Clicking login instead of sign up takes you to new user page' do 
    visit '/' 
    expect(page).to have_link 'Login', href: '/sessions/new'

    click_link 'Login'
    expect(page).to have_current_path('/sessions/new')
  end
end