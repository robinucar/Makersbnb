feature 'login page' do 
  scenario 'has title header' do 
    visit '/sessions/new' 
    expect(page).to have_content('Log in to MakersBnB')
  end
  
  scenario 'Entering email address and clicking login takes user to book a property page' do 
    visit '/sessions/new'
    fill_in :email, with: 'testemail@me.com'
    fill_in :password, with: 'pwtest123'
    click_button 'Login'

    expect(page).to have_current_path('/properties')
  end

  scenario 'Clicking Sign up takes user back to homepage' do 
    visit '/sessions/new' 
    expect(page).to have_link 'Sign up', href: '/'

    click_link 'Sign up'
    expect(page).to have_current_path('/')
  end
end