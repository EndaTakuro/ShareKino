class AddIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_reference :favorites, :member, foreign_key: true
    add_reference :favorites, :movie, foreign_key: true
    add_reference :favorites, :review, foreign_key: true
  end
end
