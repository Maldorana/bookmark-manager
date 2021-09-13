feature 'View bookmarks' do
  scenario 'Go to the bookmarks page and have the bookmarks list displayed' do
    visit('/bookmarks')
    expect(page).to have_content('www.google.com')
    expect(page).to have_content('www.amazon.co.uk')
    expect(page).to have_content('www.makers.com')
  end
end