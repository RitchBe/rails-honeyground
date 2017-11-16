class PagesController < ApplicationController
  def home
    @users = User.all
    @sellers = User.where(category: 'Seller')

  end

  def index
    @sellers = User.where(category: 'Seller').where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@sellers) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
  end
end
