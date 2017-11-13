class Sale < ApplicationRecord

  belongs_to :user
  belongs_to :product

  validates :tracking_number, uniqueness: true
end
