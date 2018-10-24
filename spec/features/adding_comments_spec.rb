feature 'Adding Comments' do
  scenario 'can add a comment to a bookmark' do
    bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit '/bookmarks'
    first('.bookmark').click_button 'Add Comment'
    fill_in 'comment', with: 'This is a comment'
    click_button 'Submit'
    expect(first('.bookmark')).to have_content 'This is a comment'
  end
end
