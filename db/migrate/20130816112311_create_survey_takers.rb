class CreateSurveyTakers < ActiveRecord::Migration
  def change
    create_table :survey_takers do |t|
      t.boolean :completed
      t.belongs_to :user
      t.belongs_to :survey
    end
  end
end
