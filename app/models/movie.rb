class Movie < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :movie_categories, dependent: :destroy
  has_many :categories, through: :movie_categories
end

