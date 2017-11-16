class UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def index
    @sellers = User.where(category: 'Seller')
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

