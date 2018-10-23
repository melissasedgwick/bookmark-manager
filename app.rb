require 'sinatra/base'
require './lib/bookmark'
require 'pg'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/bookmarks' do

    @bookmarks = Bookmark.all
    erb :view_bookmarks
  end

  post '/add_bookmark' do
    Bookmark.create(params[:bookmark], params[:title])
    redirect '/bookmarks'
  end


  run! if app_file == $0

end
