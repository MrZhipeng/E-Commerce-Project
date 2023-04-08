class Platform < ApplicationRecord
  has_many :products
  validates :name, presence: true, uniqueness: true
  paginates_per 9
end
