class SurveyTaker < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey
  has_many :votes
  
  # Remember to create a migration!

  def check_status
    @survey_taker = SurveyTaker.find_by_user_id(session[:user_id])
    if @survey_taker.complete == nil
        @survey_taker.complete = true
      return true
    else
      return false
    end
  end

end
