
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
    @article = Article.create(params)
 
    redirect "/articles/#{@article.id}"
  end

  #read
  get '/articles/:id' do
    @article = Article.find_by(id: params[:id])

    erb :show
  end

  #update
  get '/articles/:id/edit' do
    # binding.pry
    @article = Article.find_by(id: params[:id])
    
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    @article.update(title: params[:title], content: params[:content])
    
    erb :show
  end

  delete '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    @article.delete
    
    redirect '/articles'
  end
  
end
