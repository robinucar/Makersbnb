
feature 'book a property' do 
  scenario 'making a request to book a property' do 
     
    property = Property.add(
      description: "property_1",
      price: 5,
      name: "testname",
      available_from: "01/10/2022",
      available_until: "01/12/2022",
      owner_id: '123'
    )
    
    sign_up_user 
 
    visit('/properties')
    
    click_on('Book')
    
    expect(page).to have_current_path("/properties/#{property.id}")
    expect(page).to have_content('testname')
    expect(page).to have_button('Request to Book')

    fill_in :start_date, with: '2021/03/01'
    fill_in :end_date, with: '2021/03/10'
    click_button('Request to Book')
  end
end
