feature 'add spaces' do
  scenario 'landlord can list empty spaces' do
    visit('/spaces')
    fill_in('spaces', with: 'Space 1')
    click_button('Add')

    expect(page).to have_content 'Space 1'
  end
end
