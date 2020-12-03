class ChangeMobiesToMovies < ActiveRecord::Migration[5.2]
  def change
    rename_table :mobies, :movies
  end
end
