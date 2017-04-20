class User < ActiveRecord::Base
  has_secure_password
  has_many :secrets

  has_many :likes
  validates :name, :email, presence: :true
  validates :email, uniqueness: :true
  validates :name, length: { minimum: 2 }
  validates :password, length: { in: 6..20 }
end
