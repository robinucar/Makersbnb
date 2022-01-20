feature 'listing a property' do 
  scenario 'adding properties to website will make properties appear on properties page' do 
    visit '/properties/new' 
    fill_in :name, with: 'test_house_name'
    fill_in :description, with: 'pretty_space'
    fill_in :price, with: '100'
    fill_in :available_from, with: '2022/09/30' #PG error if we try '30/09/2022' 
    fill_in :available_until, with: '2022/12/31'
    click_button 'List my Property'

    expect(page).to have_current_path('/properties')
    click_button 'List a Property' 
    expect(page).to have_current_path('/properties/new')
    # adding second property:
    fill_in :name, with: 'my flat'
    fill_in :description, with: 'ugly space'
    fill_in :price, with: '1000000'
    fill_in :available_from, with: '2023/09/30' #30/09/2023 doesn't work because we get PG error 'date/time field value out of range:"
    fill_in :available_until, with: '2023/12/31'
    click_button 'List my Property'

    expect(page).to have_content 'test_house_name'
    expect(page).to have_content 'pretty_space'
    expect(page).to have_content '100.00'
    expect(page).to have_content '30-09-2022' 
    expect(page).to have_content '31-12-2022'
    
    expect(page).to have_content 'my flat'
    expect(page).to have_content 'ugly space'
    expect(page).to have_content '1000000'
    expect(page).to have_content '30-09-2023' 
    expect(page).to have_content '31-12-2023'
    
    expect(page).to have_current_path('/properties')
  end

  scenario 'clicking Properties takes you to Properties listing page' do 
    visit '/properties/new'  
    expect(page).to have_link 'Properties', href: '/properties'

    click_link 'Properties'
    expect(page).to have_current_path('/properties')
  end

end