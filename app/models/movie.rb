class Movie < ApplicationRecord
  has_many :bookmarks

  # Validations
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  # Callback to prevent destruction if bookmarks exist
  # before_destroy :prevent_destruction_if_bookmarks_exist

  # private

  # def prevent_destruction_if_bookmarks_exist
  #   throw(:abort) if bookmarks.any?
  # end
end
