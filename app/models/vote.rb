class Vote < ActiveRecord::Base
 #CODE REVIEW: What is the purpose of user here? Isn't a vote given by a survey taker? 

  belongs_to :user
  belongs_to :choice
  belongs_to :question
  belongs_to :survey_taker

  validates_presence_of :user_id
  validates_presence_of :survey_id
  validates_presence_of :question_id
  validates_presence_of :choice_id

end
