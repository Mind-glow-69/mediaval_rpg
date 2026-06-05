class CreateSteps < ActiveRecord::Migration[7.2]
  def change
    create_table :steps do |t|
      t.references :quest, null: false, foreign_key: true
      t.integer :position
      t.string :step_type
      t.integer :reward_xp

      t.timestamps
    end
  end
end
