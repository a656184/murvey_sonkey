class User < ActiveRecord::Base
  has_many :survey_takers
  has_many :surveys # through: :survey_users
  # Remember to create a migration!
end
