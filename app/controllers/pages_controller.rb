class PagesController < ApplicationController
  def home
    @users = User.all
  end

  def index
    @sellers = User.where(category: 'Seller')
  end
end
