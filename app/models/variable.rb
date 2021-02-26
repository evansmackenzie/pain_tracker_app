class Variable < ApplicationRecord

  validates :name, presence: true
  belongs_to :user
  has_many :entries
  
end
