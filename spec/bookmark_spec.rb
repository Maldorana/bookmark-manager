require 'bookmark'

describe Bookmark do
  describe '#all' do
    it 'shows bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks).to include('www.google.com')
      expect(bookmarks).to include('www.makers.com')
      expect(bookmarks).to include('www.amazon.co.uk')
    end  
  end
end