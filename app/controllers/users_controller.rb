class UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def index
    @sellers = User.where(category: 'Seller')

    @sellers = User.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@sellers) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
  end



  def show
    if @user.category == "User"
      @html = "showUser.html.erb"
    elsif @user.category == "Seller"
      @html = "showSeller.html.erb"
    elsif @user.category == "Admin"
      @html = "showAdmin.html.erb"
    end
  end


  private

  def find_user
    @user = User.find(params[:id])
  end

end

def user_params
  params.require(:user).permit(:email, :name, :nickname, :address, :category)
end

