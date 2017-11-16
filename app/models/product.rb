class Product < ApplicationRecord
  CATEGORIES = ["Liquid Honey", "Creamed Honey", "Chunk Honey", "Pasteurized Honey"]
  belongs_to :user
  has_many :sales
  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: true
  validates :category, inclusion: {in: CATEGORIES}
  has_attachment :photo
end
