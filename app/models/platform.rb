class Platform < ApplicationRecord
  has_many :products
  paginates_per 9
end
