require 'bookmark'

describe Bookmark do
  describe '#all' do
    it 'shows bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      #Add test data
      connection.exec("INSERT INTO bookmarks (url) VALUES('www.amazon.co.uk');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('www.twitter.com');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include('www.twitter.com')
      expect(bookmarks).to include('www.makersacademy.com')
      expect(bookmarks).to include('www.amazon.co.uk')
    end  
  end
end