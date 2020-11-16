class CreateMobies < ActiveRecord::Migration[5.2]
  def change
    create_table :mobies do |t|
      t.string :title
      t.text :introduction
      t.string :image_id
      t.timestamps
    end
  end
end
