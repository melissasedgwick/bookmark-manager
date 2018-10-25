CREATE TABLE bookmarks_tags (id SERIAL PRIMARY KEY, bookmarks_id INTEGER, FOREIGN KEY(bookmarks_id) REFERENCES bookmarks(id), tags_id INTEGER, FOREIGN KEY(tags_id) REFERENCES tags(id));
