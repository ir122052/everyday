class Task < ApplicationRecord
    validates :amount, length: { maximum: 100 }
    validates :title, presence: true
    belongs_to :user
end
