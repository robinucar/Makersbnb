feature 'listing a property' do 
  scenario 'adding properties to website will make properties appear on properties page' do 
    visit '/properties/new' 
    fill_in :name, with: 'test_house_name'
    fill_in :description, with: 'pretty_space'
    fill_in :price, with: '100'
    fill_in :available_from, with: '01/02/22'
    fill_in :available_until, with: '12/31/22'
  
    click_button 'List my Property'
    expect(page).to have_content 'test_house_name'
    expect(page).to have_content 'pretty_space'
    expect(page).to have_content '100'
    expect(page).to have_content '2022-01-02' 
    expect(page).to have_content '2022-12-31'
    
    expect(page).to have_current_path('/properties')
  end

  # scenario 'Clicking Sign out takes you to the home page' do
  #   visit '/'
  #   fill_in :email, with: 'testemail@me.com'
  #   fill_in :password, with: 'pwtest123'
  #   fill_in :password_confirmation, with: 'pwtest123'
  
  #   click_button 'Sign up'
    
  #   visit '/properties/new'  
  #   expect(page).to have_link 'Sign out', href: '/'

  #   click_link 'Sign out'
  #   expect(page).to have_current_path('/')
  # end THIS TEST IS DUPLICATE OF WHATS IN VIEWING_PROPERTIES_SPEC.rb

  scenario 'clicking Properties takes you to Properties listing page' do 
    visit '/properties/new'  
    expect(page).to have_link 'Properties', href: '/properties'

    click_link 'Properties'
    expect(page).to have_current_path('/properties')
  end

end