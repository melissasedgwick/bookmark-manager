require 'bookmark'

describe Bookmark do

  describe '#all' do

    it 'returns bookmarks' do
      expect(Bookmark.all).to be_a(Array)
    end

    it 'contains urls' do
      expect(Bookmark.all).to include('http://www.makersacademy.com')
    end

  end

end
