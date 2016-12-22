get '/posts' do
  @posts = Post.all
  erb :'/posts/index.html'
end

get '/posts/new' do
  if current_user
    erb :'posts/new.html' #show new posts view
  else
    redirect '/'
  end
end

post '/posts' do
  #below works with properly formatted params in HTML form
  @post = Post.new(params[:post]) #create new post
  if @post.save #saves new post or returns false if unsuccessful
    redirect '/posts' #redirect back to posts index page
  else
    erb :'posts/new.html' # show new posts view again(potentially displaying errors)
  end
end

get '/posts/:id' do
  #gets params from url
  @post = Post.find(params[:id]) #define instance variable for view
  erb :'posts/show.html' #show single post view
end

get '/posts/:id/edit' do
  #get params from url
  @post = Post.find(params[:id]) #define intstance variable for view
  erb :'posts/edit.html' #show edit post view
end

put '/posts/:id' do
  #get params from url
  @post = Post.find(params[:id]) #define variable to edit
  @post.assign_attributes(params[:post]) #assign new attributes
  if @post.save #saves new post or returns false if unsuccessful
    redirect '/posts' #redirect back to posts index page
  else
    erb :'posts/edit.html' #show edit post view again(potentially displaying errors)
  end
end

delete '/posts/:id' do
  #get params from url
  @post = Post.find(params[:id]) #define post to delete
  @post.destroy #delete post
  redirect '/posts' #redirect back to posts index page
end