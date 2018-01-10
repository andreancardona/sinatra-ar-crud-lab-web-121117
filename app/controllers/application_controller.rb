require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

#Homepage - Shows all posts
# INDEX ACTION
  get '/posts' do
    @posts = Post.all #AR code allowed
    erb :"index"
  end


  #NEW -> SHOW A FORM to the user
  #Get posts/new
  #Display form to create a new post

  get '/posts/new' do
    erb :"new"
  end

  #post the received information into our database
    post '/posts' do
      # binding.pry
      @post = Post.create(name: params[:name], content: params[:content])
      redirect "/posts/#{@post.id}"
    end

  get '/posts/:id' do
    # binding.pry
    @post = Post.find_by(id: params[:id])
    erb :"show"
  end

  patch '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    @post.update(name: params[:name], content: params[:content])
    redirect "/posts/#{@post.id}"
  end


end
