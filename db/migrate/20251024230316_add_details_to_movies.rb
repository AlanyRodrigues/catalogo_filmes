class AddDetailsToMovies < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :year, :integer
    add_column :movies, :duration, :string
    add_column :movies, :director, :string
  end
end
