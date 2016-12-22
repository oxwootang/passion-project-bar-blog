# display count of total registered users
# TODO - use jQuery/AJAX for a button click action that will display/hide the total number of registered users for the site
get '/users' do
  @users = User.all #define instance variable for view
  erb :'users/index.html' #show all users view (index)
end

# get the form for creating a new user
# TODO - use jQuery/AJAX to show/display create new user form
get '/users/new' do
  if request.xhr?
    erb :'users/_new_user_form.html', layout: false
    #show new users view
  else
    erb :'users/new.html'
  end
end

# create a new user
post '/users' do
  #below works with properly formatted params in HTML form
  @user = User.new(params[:user]) #create new user
  p @user
  if @user.save #saves new user or returns false if unsuccessful
    p "user is saved as: #{@user.f_name}"
    login(@user)
    redirect '/' #redirect back to users index page
  else
    erb :'users/new.html' # show new users view again(potentially displaying errors)
  end

end
