class CreateQuestRewards < ActiveRecord::Migration[7.2]
  def change
    create_table :quest_rewards do |t|
      t.references :quest, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
