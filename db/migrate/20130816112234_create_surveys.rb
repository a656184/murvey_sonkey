class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :title
      t.timestamps
      t.belongs_to :user
    end
  end
end
