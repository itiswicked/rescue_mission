class CreateAnswersTable < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to :question, null: false
      t.string :body, null: false
    end
  end
end
