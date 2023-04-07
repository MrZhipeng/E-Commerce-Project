class Product < ApplicationRecord
  belongs_to :platform
  paginates_per 9
  validates :name, :description, :price, presence: true
  has_one_attached :image
end
