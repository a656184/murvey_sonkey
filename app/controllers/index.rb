get '/' do
  erb :index
end

get '/user' do

  #CODE REVIEW: This can be simplified using AR join query and where not.  You should not need the 'each ' or the Survey.all.  You may need to adjust your associations. 

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

#CODE REVIEW: Use nested params in your form so you don't have to write out the complete hash here.  EX @survey=Survey.create(params[:survey]) if there are params on your form you don't need here, or just: @survey=Survey.create(params) if you are using all of the input from your form.  
  @survey = Survey.create(title: params[:title], user_id: session[:user_id] )
  
#CODE REVIEW: Only store the @survey.id in the session, not the whole object. 
  session[:survey_object] = @survey
  # display new survey form
  erb :create_survey
end

#submit info for new survey
post '/survey' do
  @survey = session[:survey_object]
  
#CODE REVIEW: This is 'begging' for a helper method. Also, using nested params can avoid the choice1, choice2, ... issue.

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
  p params[:choices]
 
  params[:choices].each do |question_id, choice_id|
    @vote = Vote.create(user_id: session[:user_id], survey_id: params[:survey_id], question_id: question_id, choice_id: choice_id)
  end

  redirect '/user'
end

# -------- Results --------------

get '/survey/results/:id' do
  @survey = Survey.find(params[:id])
  @questions = Question.where(survey_id: @survey.id)
  erb :results
end
