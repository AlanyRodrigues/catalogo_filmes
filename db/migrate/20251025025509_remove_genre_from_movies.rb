class RemoveGenreFromMovies < ActiveRecord::Migration[7.1]
  def change
    remove_column :movies, :genre, :string
  end
end
