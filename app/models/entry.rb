class Entry < ApplicationRecord

  validates :value, numericality: true
  belongs_to :variable
  
end
