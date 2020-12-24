class ChangeColumnsAddNotnullOnTags < ActiveRecord::Migration[5.2]
  def change
    change_column :tags, :tag_name, :string, null: false
  end
end
