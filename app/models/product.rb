class Product < ApplicationRecord
  belongs_to :platform
  paginates_per 9
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :on_sale_price, numericality: { greater_than_or_equal_to: 0, less_than: :price }, allow_nil: true
  validates :description, presence: true
  has_one_attached :image
end
