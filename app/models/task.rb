class Task < ApplicationRecord
    validates :amount, length: { maximum: 50 }
    validates :title, presence: true
    belongs_to :user
end
