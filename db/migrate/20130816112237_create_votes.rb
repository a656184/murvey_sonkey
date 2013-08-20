class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
    	#why does a vote belong to a survey - not just a question? (unless a question can be on many surveys)
      t.belongs_to :user
      t.belongs_to :choice
      t.belongs_to :question
      t.belongs_to :survey
    end
  end
end
