require 'tag'
require 'database_helpers'
require 'bookmark'

describe Tag do

  describe '#create' do
    it 'creates a new tag' do
      tag = Tag.create(content: 'test tag')
      expect(tag).to be_a Tag
      expect(tag.content). to eq 'test tag'
    end
  end

end
