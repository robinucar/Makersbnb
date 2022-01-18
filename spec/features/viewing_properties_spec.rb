feature 'viewing properties' do 
  scenario 'book a property' do 
    visit '/properties' 
    expect(page).to have_content('Book a Property')
  end

  scenario 'displays list of properties' do 
  end

  scenario 'user can navigate to list a property page' do 
    visit '/properties'
    click_on 'List a Property'
    expect(page).to have_current_path('/properties/new')
  end

  scenario 'Clicking Sign out takes you to the home page' do
    visit '/'
    fill_in :email, with: 'testemail@me.com'
    fill_in :password, with: 'pwtest123'
    fill_in :password_confirmation, with: 'pwtest123'
  
    click_button 'Sign up'
    
    expect(current_path).to eq '/properties'
    expect(page).to have_link 'Sign out', href: '/'

    click_link 'Sign out'
    expect(page).to have_current_path('/')
  end
end
