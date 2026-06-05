class CreateItems < ActiveRecord::Migration[7.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :slot
      t.integer :life_delta
      t.integer :strength_delta
      t.integer :xp_bonus
      t.string :image_url

      t.timestamps
    end
  end
end
