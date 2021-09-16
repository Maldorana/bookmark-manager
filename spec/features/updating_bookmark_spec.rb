require 'pg'

feature "Updating a bookmark" do
  scenario 'A user can update a bookmark' do
    bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')

    first('.bookmark').click_button 'Edit'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"
    fill_in :url, with: 'www.facebook.com'
    fill_in :title, with: 'Facebook'
    click_button('Edit')
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Facebook', href: 'www.facebook.com')
  end
end