get '/' do
  erb :index
end

get '/user' do
  @taken_surveys = []
  @all_votes = Vote.where(user_id: current_user.id)
  @all_votes.each do |t|
    @taken_surveys << Survey.find(t.survey_id)
  end
  @taken_surveys
  @created_surveys = current_user.surveys
  @all_surveys = Survey.all
  @untaken_surveys = (@all_surveys - @taken_surveys)
  erb :profile
end

# ------- Creator of Survey ------

get '/survey/new'do
  @survey = Survey.create(title: params[:title], user_id: session[:user_id] )
  session[:survey_object] = @survey
  # display new survey form
  erb :create_survey
end

#submit info for new survey
post '/survey' do
  @survey = session[:survey_object]
  @choices =[]
  @choices.push (params[:choice1])
  @choices.push (params[:choice2])
  @choices.push (params[:choice3])
  @choices.push (params[:choice4])
  @question = Question.create(survey_id: @survey.id, prompt: params[:prompt])

  @choices.each do |choice|
    Choice.create(question_id: @question.id, option: choice)
  end

  erb :_survey_components, :layout => false
end

# ------- Taker of Survey ------

#display survey to take
get '/survey/:id' do

  @survey = Survey.find(params[:id])
  @question = Question.where(survey_id: @survey.id)
  @choice = Choice.where(question_id: @question[0].id)
  erb :take_survey
end

#submit info for survey taken
post '/survey/:id' do
  p params
  @vote = Vote.create(user_id: session[:user_id], survey_id: params[:survey_id], question_id: params[:question_id], choice_id: params[:choice_id])
  redirect '/user'
end
