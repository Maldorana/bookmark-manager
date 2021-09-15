require 'pg'

feature 'View bookmarks' do
  scenario 'Go to the bookmarks page and have the bookmarks list displayed' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks VALUES(1, 'www.twitter.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'www.amazon.co.uk');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'www.makersacademy.com');")
    
    visit('/bookmarks')
    expect(page).to have_content('www.twitter.com')
    expect(page).to have_content('www.amazon.co.uk')
    expect(page).to have_content('www.makersacademy.com')
  end
end