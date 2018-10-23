require 'pg'

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
    Bookmark.create("http://www.makersacademy.com", "makers")
    Bookmark.create("http://www.destroyallsoftware.com", "destroy all software")
    Bookmark.create("http://www.google.com", "google")
    visit('/bookmarks')

    expect(page).to have_content "makers"
    expect(page).to have_content "destroy all software"
    expect(page).to have_content "google"
  end

end
