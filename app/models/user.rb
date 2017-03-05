class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {in: 4..12}, format: {with: /\A[a-zA-Z][a-zA-Z0-9_-]*\Z/}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  #validates :password, presence: true, length: {minimum: 6}

  def name
    "#{first_name} #{last_name}"
  end

  def to_param
    username
  end

  #gravatar kullanımı
  def avatar_url
    hash_value = Digest::MD5.hexdigest(email.downcase)
    "http://www.gravatar.com/avatar/#{hash_value}?s=160"
  end

  def oturum
    
  end
end
