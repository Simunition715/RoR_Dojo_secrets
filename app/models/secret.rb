class Secret < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  validates :secret, length: { minimum: 3 }
end
