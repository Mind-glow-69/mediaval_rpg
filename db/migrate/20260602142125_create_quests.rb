class CreateQuests < ActiveRecord::Migration[7.2]
  def change
    create_table :quests do |t|
      t.string :title
      t.text :description
      t.integer :reward_xp
      t.boolean :published

      t.timestamps
    end
  end
end
