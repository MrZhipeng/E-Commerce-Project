class Product < ApplicationRecord
  belongs_to :platform
  paginates_per 20
  validates :name, :description, :price, presence: true
end
