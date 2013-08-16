user1 = User.new(name: 'User1', email: 'a@email.com')
user1.password = 'password'
user1.save

user2 = User.new(name: 'User2', email: 'b@email.com')
user2.password = 'password'
user2.save

user3 = User.new(name: 'User3', email: 'c@email.com')
user3.password = 'password'
user3.save

survey1 = user1.surveys.create(title: 'Survey1')
survey2 = user1.surveys.create(title: 'Survey2')
survey3 = user2.surveys.create(title: 'Survey3')
survey4 = user2.surveys.create(title: 'Survey4')


question1 = survey1.questions.create(prompt: 'prompt question')
question2 = survey2.questions.create(prompt: 'prompt question for survey 2')
question3 = survey3.questions.create(prompt: 'prompt question for survey 3')
question4 = survey4.questions.create(prompt: 'prompt question for survey 4')

choice1 = question1.choices.create(option: 'true')
choice2 = question1.choices.create(option: 'false')

choice3 = question2.choices.create(option: 'true')
choice4 = question2.choices.create(option: 'false')

choice5 = question3.choices.create(option: 'true')
choice6 = question3.choices.create(option: 'false')

choice7 = question4.choices.create(option: 'true')
choice8 = question4.choices.create(option: 'false')

s_taker1 = user3.survey_takers.create(survey_id: survey1.id, completed: false)
s_taker2 = user3.survey_takers.create(survey_id: survey2.id, completed: true)
s_taker3 = user3.survey_takers.create(survey_id: survey3.id, completed: false)
s_taker4 = user3.survey_takers.create(survey_id: survey4.id, completed: true)

vote1 = user3.votes.create(choice_id: choice1.id, question_id: question1.id, survey_taker_id: s_taker1.id)
vote2 = user3.votes.create(choice_id: choice4.id, question_id: question2.id, survey_taker_id: s_taker2.id)
vote3 = user3.votes.create(choice_id: choice5.id, question_id: question3.id, survey_taker_id: s_taker3.id)
vote4 = user3.votes.create(choice_id: choice8.id, question_id: question4.id, survey_taker_id: s_taker4.id)

