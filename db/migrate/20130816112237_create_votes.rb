class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user
      t.belongs_to :choice
      t.belongs_to :question
      t.belongs_to :survey_taker
    end
  end
end
