feature 'listing a property' do 
  scenario 'landlord/user can add a property to website' do 
    visit '/properties/new' 
    fill_in :name, with: 'test_house_name'
    fill_in :description, with: 'pretty_space'
    fill_in :price, with: '100'
    fill_in :available_from, with: '01/02/22'
    fill_in :available_until, with: '12/31/22'
  
    click_button 'List my Property'

    expect(page).to have_current_path('/properties')
  end

  scenario 'Clicking Sign out takes you to the home page' do 
    visit '/properties/new'  
    expect(page).to have_link 'Sign out', href: '/'

    click_link 'Sign out'
    expect(page).to have_current_path('/')
  end

  scenario 'Clicking Sign out takes you to the home page' do 
    visit '/properties/new'  
    expect(page).to have_link 'Properties', href: '/properties'

    click_link 'Properties'
    expect(page).to have_current_path('/properties')
  end

end