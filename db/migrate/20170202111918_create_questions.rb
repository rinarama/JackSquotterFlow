class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, :null => false
      t.string :content, :null => false
      t.references :user, :null => false
      t.integer :best_answers

      t.timestamps(null: false)
    end
  end
end
