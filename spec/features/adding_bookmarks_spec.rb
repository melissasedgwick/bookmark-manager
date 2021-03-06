feature 'Adding bookmarks' do
  scenario 'Can add a URL to bookmarks' do
    visit('/')
    click_button('View Bookmarks')
    fill_in :url, with: 'http://www.facebook.com'
    fill_in :title, with: 'Facebook'
    click_button('Submit')
    expect(page).to have_link('Facebook', href: 'http://www.facebook.com')
  end
end
