get '/login' do
  erb :login
end

post '/login' do
  user = User.authenticate(params[:name], params[:password])
  if user
    session[:user_id] = user.id
  else
    session[:user_id] = nil
  end
  redirect '/'
end

post '/sign_up' do
  user = User.new(name: params[:name], email: params[:email])
  user.password = params[:password]
  user.save
  # THIS NEEDS TO BE FIXED SO THE USER IS ONLY LOGGED IN IF THE VALIDATIONS PASS
  session[:user_id] = user.id
  redirect '/'
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
