class Product < ApplicationRecord

  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: true

  has_attachment :photo
end
