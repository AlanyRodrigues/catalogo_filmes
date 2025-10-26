class Comment < ApplicationRecord
  belongs_to :movie

  validates :name, :content, presence: true
end
