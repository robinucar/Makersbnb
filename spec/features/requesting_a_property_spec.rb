
# feature 'book a property' do 
#   scenario 'making a request to book a property' do 
#     sign_up_user

#     property = Property.add(
#       description: "property_1",
#       price: 5,
#       name: "testname",
#       available_from: "01/10/2022",
#       available_until: "01/12/2022",
#       owner_id: '123'
#     )
#     click_button 'Book'
#     expect(page).to have_current_path("/properties/#{property.id}")
#     expect(page).to have_content('testname')
#     expect(page).to have_button('Request to Book')
#   end
