class Frm < ApplicationRecord
  has_many :topics
  validates :name, presence: true, uniqueness: true
end
