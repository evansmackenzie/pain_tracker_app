class User < ApplicationRecord
  
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :variables
  has_many :posts
  has_many :entries, through: :variables
  

end
