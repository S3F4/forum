class Frm < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
