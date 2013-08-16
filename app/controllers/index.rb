get '/' do
  erb :index
end

get '/user' do
  @taken_surveys = current_user.survey_takers
  @created_surveys = current_user.surveys
  @all_surveys = Survey.all
  erb :profile
end

# ------- Creator of Survey ------

get '/survey/new'do
  # display new survey form
  erb :create_survey
end

post '/survey' do
  # p params
  @survey = Survey.create(title: params[:title], user_id: 1)
  # p params[:choice]

  @question = Question.create(survey_id: @survey.id, prompt: params[:prompt])

  Choice.create(question_id: @question.id, option: params[:choice])

  #need survey title and user id in params to create survey
  # submit info for new survey
  redirect "/user/#{session[:user_id]}"
end

# ------- Taker of Survey ------

get '/survey/:id' do
  @survey = Survey.find(params[:id])

  @question = Question.where(survey_id: @survey.id)

  @choice = Choice.where(question_id: @question[0].id)
  # display survey to take
  erb :take_survey
end

post '/survey/:id' do
  p params
  # submit info for survey taken
  redirect "/user/#{session[:user_id]}"
end
