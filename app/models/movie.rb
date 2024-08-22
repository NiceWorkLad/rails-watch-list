class Movie < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :overview, presence: true
end
