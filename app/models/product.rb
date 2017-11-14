class Product < ApplicationRecord

  belongs_to :user
  has_many :sales
  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: true

end
