class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  USERTYPE = ["Admin", "User", "Seller"]
  validates :name, presence: true
  validates :nickname, presence: true
  validates :address, presence: true
  validates :type, presence: true, inclusion: {in: USERTYPE}
  has_many :sales
  has_many :products
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end

