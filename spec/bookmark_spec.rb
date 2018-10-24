require 'bookmark'
require 'database_helpers'

describe Bookmark do

  describe '#all' do
    it 'returns bookmarks' do
      expect(Bookmark.all).to be_a(Array)
    end

    it 'contains urls' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers")
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.create(url: "http://www.google.com", title: "Google")
      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
   end
  end

  describe '#create' do
    it 'adds a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testurl.com', title: 'Test Title')
      persisted_data = persisted_data(bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'Test Title'
      expect(bookmark.url).to eq 'http://www.testurl.com'
    end

    it 'does not create a new bookmark if the URL is invalid' do
      bookmark = Bookmark.create(url: 'not_a_url', title: 'Not A URL')
      expect(Bookmark.all).not_to include 'not_a_url'
    end
  end

  describe '#delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testurl.com', title: 'Test Title')
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '#update' do
    it 'updates a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testurl.com', title: 'Test Title')
      updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://diffurl.com', title: 'Diff Title')
      expect(updated_bookmark.title).to eq 'Diff Title'
      expect(updated_bookmark.url).to eq 'http://diffurl.com'
    end
  end

  describe '.find' do
    it 'returns the requested bookmark object' do
      bookmark = Bookmark.create(title: 'Makers', url: 'http://www.makersacademy.com')

      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Makers'
      expect(result.url).to eq 'http://www.makersacademy.com'
    end
  end

end
