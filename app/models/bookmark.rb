class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  # do not understand this
  validates :comment, length: { minimum: 6 }
  validates :movie, uniqueness: { scope: :list }
end
