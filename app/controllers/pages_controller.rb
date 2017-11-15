class PagesController < ApplicationController
  def home
    @users = User.all
    @sellers = User.where(category: 'Seller')

  end

  def index
    @sellers = User.where(category: 'Seller')
  end
end
