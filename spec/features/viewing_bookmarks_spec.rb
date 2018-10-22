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
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

    visit('/bookmarks')

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end

end
