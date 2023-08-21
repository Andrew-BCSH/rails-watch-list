class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  attribute :comment, :text

  # Validations
  validates :movie, presence: true
  validates :list, presence: true
  validates :comment, presence: true, length: { minimum: 6 }
  validates :movie_id, uniqueness: { scope: :list_id, message: "Bookmark for this movie/list already exists" }

  # Additional methods or scopes
end
