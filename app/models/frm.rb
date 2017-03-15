class Frm < ApplicationRecord
  has_many :topics
  has_many :comments, through: :topics

  validates :name, presence: true, uniqueness: true
end
