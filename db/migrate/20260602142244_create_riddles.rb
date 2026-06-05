class CreateRiddles < ActiveRecord::Migration[7.2]
  def change
    create_table :riddles do |t|
      t.references :step, null: false, foreign_key: true
      t.text :question
      t.text :answers
      t.string :correct_answer

      t.timestamps
    end
  end
end
