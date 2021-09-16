require 'pg'

feature 'View bookmarks' do
  scenario 'Go to the bookmarks page and have the bookmarks list displayed' do
    # Add the test data
    Bookmark.create(url: "www.twitter.com", title: "Twitter")
    Bookmark.create(url: "www.makers.com", title: "Makers Academy")
    Bookmark.create(url: "www.amazon.co.uk", title: "Amazon")
    
    visit('/bookmarks')

    expect(page).to have_link('Makers Academy', href: 'www.makers.com')
    expect(page).to have_link('Twitter', href: 'www.twitter.com')
    expect(page).to have_link('Amazon', href: 'www.amazon.co.uk')
  end
end