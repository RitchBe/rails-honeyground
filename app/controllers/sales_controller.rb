class SalesController < ApplicationController

  before_action :set_sale, only: [:show]

  def index
    @sales = current_user.sales
  end

  def show
    @user = User.find(current_user.id)
    @product = Product.find(params[:product_id])


  end

  def new

    @user = User.find(current_user.id)
    @product = Product.find(params[:product_id])

    @sale = Sale.new
  end

  def create
    @sale = Sale.create(sale_params)

    redirect_to user_sales_path(current_user.id)
  end

  private

  def set_sale
    @sale  = Sale.find(params[:id])
  end

  def sale_params
    params.require(:sale).permit(:user_id, :product_id, :tracking_number, :status)
  end
end
