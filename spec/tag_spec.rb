require 'tag'
require 'database_helpers'
require 'bookmark_tag'

describe Tag do

  describe '#create' do
    it 'creates a new tag' do
      tag = Tag.create(content: 'test tag')
      expect(tag).to be_a Tag
      expect(tag.content). to eq 'test tag'
    end
  end

  describe '#where' do
    it 'shows tags linked to a bookmark' do
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      tag1 = Tag.create(content: 'A tag')
      tag2 = Tag.create(content: 'A second tag')

      BookmarkTag.create(bookmark_id: bookmark.id, tag_id: tag1.id)
      BookmarkTag.create(bookmark_id: bookmark.id, tag_id: tag2.id)

      tags = Tag.where(bookmark_id: bookmark.id)
      tag = tags.first
      expect(tags.length).to eq 2
      expect(tag).to be_a Tag
      expect(tag.id).to eq tag1.id
      expect(tag.content).to eq tag1.content
    end
  end

end
