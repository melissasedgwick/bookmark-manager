feature 'Viewing bookmarks' do
  scenario 'visiting the main page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end
end
