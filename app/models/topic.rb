class Topic < ApplicationRecord
  belongs_to :user
  belongs_to :frm
  has_many :comments,dependent: :destroy

  validates :user, presence: true
  validates :frm, presence: true #hem nesne varlığı hem de alttaki :forum_id varlığı kontrol edilmelidir yoksa saçma bir kayıt kabul edilebilir.

  validates :title, presence: true
  validates :body, presence: true, length: {minimum: 20}
  validates :user_id, presence: true
  validates :frm_id, presence: true
end
