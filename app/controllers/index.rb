get '/user/:user_id' do
  # Look in app/views/index.erb
  erb :profile
end

# ------- Creator of Survey ------

get '/survey/new'do
  # display new survey form
  erb :create_survey
end

post '/survey' do
  p params
  @survey = Survey.new(title: params[:title], user_id:session[:user_id])
  #need survey title and user id in params to create survey
  # submit info for new survey
  redirect '/user/:user_id'
end

# ------- Taker of Survey ------

get '/survey/:id' do
  # display survey to take
  erb :take_survey
end

post '/survey/:id' do
  # submit info for survey taken
  redirect '/user/:user_id'
end
