require 'bookmark'

describe Bookmark do

  describe '#all' do

    it 'returns bookmarks' do
      expect(Bookmark.all).to be_a(Array)
    end

    it 'contains urls' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'makers');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'destroy all software');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'google');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include({url: 'http://www.makersacademy.com' , title: 'makers'})
      expect(bookmarks).to include({url: 'http://www.destroyallsoftware.com' , title: 'destroy all software'})
      expect(bookmarks).to include({url: 'http://www.google.com' ,title: 'google'})
      end

  end

  describe '#create' do

    it 'adds a bookmark' do
      Bookmark.create('http://testurl.com', 'test title')
      bookmarks = Bookmark.all
      expect(bookmarks).to include({url: "http://testurl.com" , title: "test title"})
    end

  end

end
