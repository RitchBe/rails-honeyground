class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  USERCATEGORY = ["Admin", "User", "Seller"]
  validates :name, presence: true
  validates :nickname, presence: true
  validates :address, presence: true
  validates :category, presence: true, inclusion: {in: USERCATEGORY}
  has_many :sales
  has_many :products
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end

