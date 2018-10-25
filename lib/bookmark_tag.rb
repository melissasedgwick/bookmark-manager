require_relative 'database_connection'

 class BookmarkTag

  attr_reader :bookmark_id, :tag_id

  def initialize(bookmark_id:, tag_id:)
    @bookmark_id = bookmark_id
    @tag_id = tag_id
  end


  def self.create(bookmark_id:, tag_id:)
    result = DatabaseConnection.query("INSERT INTO bookmarks_tags (bookmarks_id, tags_id) VALUES('#{bookmark_id}', '#{tag_id}') RETURNING bookmarks_id, tags_id;")
    BookmarkTag.new(bookmark_id: result[0]['bookmarks_id'], tag_id: result[0]['tags_id'])
  end

end
