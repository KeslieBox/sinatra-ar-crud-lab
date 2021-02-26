
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  #new
  get '/articles/new' do
    @article = Article.new

    erb :new
  end

  #create
  post '/articles' do
    # binding.pry
    @article = Article.create(params)
    # binding.pry

    redirect "/articles/#{@article.id}"
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])

    erb :show
  end

  
end
