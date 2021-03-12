class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :products, through: :order_items

  validates :number, presence: true
  validates :total, presence: true
  validates :state, presence: true
  validates :total, numericality: { greater_than_or_equal_to: 10 }
end
