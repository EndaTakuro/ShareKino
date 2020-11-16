class CreateIvents < ActiveRecord::Migration[5.2]
  def change
    create_table :ivents do |t|
      t.string :title
      t.text :content
      t.string :image
      t.timestamps
    end
  end
end
