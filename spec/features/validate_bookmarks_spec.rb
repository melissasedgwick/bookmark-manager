feature 'Validate Bookmarks' do
  scenario 'page shows error message if not real URL' do
    visit('/bookmarks')
    fill_in :url, with: 'not_a_url'
    fill_in :title, with: 'Not A URL'
    click_button('Submit')
    expect(page).not_to have_content('not_a_url')
    expect(page).not_to have_content('Not A URL')
    expect(page).to have_content('You must submit a valid URL')
  end
end
