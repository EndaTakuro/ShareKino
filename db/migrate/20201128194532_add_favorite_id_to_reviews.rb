class AddFavoriteIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :favorite, foreign_key: true
  end
end
