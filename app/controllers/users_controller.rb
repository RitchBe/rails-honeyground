class UsersController < ApplicationController
  before_action :find_user, only: [:show]



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

