class Entry < ApplicationRecord

validates :value, numericality: { greater_than_or_equal_to: 0 }
validates :rating, numericality: { greater_than_or_equal_to: 0 }
validates :rating, numericality: { less_than_or_equal_to: 10 }
belongs_to :variable
  
end
