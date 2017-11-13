class Product < ApplicationRecord
  belongs_to :user_id

  validates :name, presence: true
  validates :description, presence: true
  validates :rating, numericality: true
end
