require 'bookmark'
require 'database_helpers'

describe Bookmark do
  describe '#all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
   
      # Add the test data
      bookmark = Bookmark.create(url: "http://www.makers.com", title: "Makers Academy")
      Bookmark.create(url: "http://www.twitter.com", title: "Twitter")
      Bookmark.create(url: "http://www.google.com", title: "Google")
   
      bookmarks = Bookmark.all
   
      expect(bookmarks.length).to eq(3)
      expect(bookmarks.first).to be_a(Bookmark)
      expect(bookmarks.first.id).to eq(bookmark.id)
      expect(bookmarks.first.title).to eq('Makers Academy')
      expect(bookmarks.first.url).to eq('http://www.makers.com')
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.example.org', title: 'Example')
      persisted_data = persisted_data(id: bookmark.id)
    
      expect(bookmark).to be_a(Bookmark)
      expect(bookmark.id).to eq(persisted_data['id'])
      expect(bookmark.title).to eq('Example')
      expect(bookmark.url).to eq('http://www.example.org')
    end
  end

  describe '.delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.example.org', title: 'Example')
      persisted_data = persisted_data(id: bookmark.id)
    
      expect(bookmark.delete).to be_empty
    end
  end
end