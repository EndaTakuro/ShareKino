class RemoveFavoriteFromReview < ActiveRecord::Migration[5.2]
  def change
    #remove_foreign_key :reviews, :favorite
    remove_reference :reviews, :favorite, foreign_key: true
  end
end
