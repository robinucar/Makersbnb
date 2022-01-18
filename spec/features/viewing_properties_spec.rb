feature 'viewing properties' do 
  scenario 'book a property' do 
    visit '/properties' 
    expect(page).to have_content('Book a Property')
  end

  scenario 'displays list of properties' do 
    visit '/properties'
    
  end

  scenario 'user can navigate to list a property page' do 
    visit '/properties'
    click_on 'List a Property'
    expect(page).to have_current_path('/properties/new')
  end

  scenario 'Clicking Sign out takes you to the home page' do 
    visit '/properties' 
    expect(page).to have_link 'Sign out', href: '/'

    click_link 'Sign out'
    expect(page).to have_current_path('/')
  end
end
