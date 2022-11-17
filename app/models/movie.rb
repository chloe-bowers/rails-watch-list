class Movie < ApplicationRecord
  has_many :bookmarks
  validates :overview, :title, presence: true
  validates :title, uniqueness: true
end
