feature 'Viewing bookmarks' do
  scenario 'visiting the main page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end

  scenario 'view bookmarks button leads to another page' do
    visit('/')
    click_button('View Bookmarks')
    expect(page).to have_content 'Favourite Websites'
  end

  scenario 'shows bookmarks on webpage' do
    visit('/')
    click_button('View Bookmarks')
    expect(page).to have_content 'http://www.makersacademy.com'
  end

end
