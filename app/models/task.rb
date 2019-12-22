class Task < ApplicationRecord
    validates :amount, length: { maximum: 50 }
    
    belongs_to :user
end
