feature 'Add new bookmark' do
  scenario 'Go to the /new page, enter the url, click on submit and see the url has been saved' do
    visit('/bookmarks/new')
    fill_in :url, with: 'www.google.com'
    fill_in :title, with: 'Google'
    click_button('Submit')
    expect(page).to have_link('Google', href: 'www.google.com')
  end
end