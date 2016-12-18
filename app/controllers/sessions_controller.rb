# get form for returning user sign-in
get '/sessions/new' do
  erb :'sessions/new.html'
end

# log-in user if user exists, else return view for log-in page
post '/sessions' do
  if user = User.find_by(email: params['email'])
    login(user)
    redirect '/'
  else
    erb :'/sessions/new.html'
  end
end

# logout user and return to homepage
delete '/sessions/logout' do
  logout
  redirect '/'
end