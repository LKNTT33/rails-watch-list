class Movie < ApplicationRecord
  has_many :bookmarks

  # Validations
  validates :title, :overview, presence: true, uniqueness: true
end
