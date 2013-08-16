class SurveyTaker < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey
  has_many :votes
  # Remember to create a migration!
end
