feature 'Tagging books' do
  scenario 'user can tag a book' do
    bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit '/bookmarks'
    first('.bookmark').click_button 'Add Tag'

    fill_in 'tag', with: 'This is a tag'
    click_button 'Submit'

    expect(first('.bookmark')).to have_content 'This is a tag'
  end
end
