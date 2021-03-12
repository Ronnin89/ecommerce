class OrderItem < ApplicationRecord
    validates :quantity, presence: true
    validates :price, presence: true
    validates :quantity, numericality: { greater_than_or_equal_to: 1 }
    validates :price, numericality: { greater_than_or_equal_to: 10 }

    belongs_to :product
    belongs_to :order
end