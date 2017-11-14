class Sale < ApplicationRecord
  STATUS = ["On it´s way", "Confirmed", "Pending acceptance", "Order awaiting to be confirmed"]

  belongs_to :user
  belongs_to :product

  validates :tracking_number, uniqueness: true
end
