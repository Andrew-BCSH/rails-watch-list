class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  # Validations
  validates :name, presence: true, uniqueness: true

  # Callback to destroy associated movies when destroying self
  # before_destroy :destroy_child_saved_movies

  # private

  # def destroy_child_saved_movies
  #   movies.destroy_all
  # end
end
