require_relative './database_connection'

class Tag

  attr_reader :id, :content

  def initialize(id:, content:)
    @id = id
    @content = content
  end

  def self.create(content:)
    result = DatabaseConnection.query("INSERT INTO tags (content) VALUES('#{content}') RETURNING id, content;")
    Tag.new(id: result[0]['id'], content: result[0]['content'])
  end

  def self.where(bookmark_id:)
    result = DatabaseConnection.query("SELECT tags.id, content FROM bookmarks_tags INNER JOIN tags ON tags.id = bookmarks_tags.tags_id WHERE bookmarks_tags.bookmarks_id = '#{bookmark_id}';")
    result.map do |tag|
      Tag.new(id: tag['id'], content: tag['content'])
    end
  end

end
