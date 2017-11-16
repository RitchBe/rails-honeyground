class SalesController < ApplicationController

  before_action :set_sale, only: [:show, :update]

  def index
    @sales = User.find(current_user.id).sales
    @products = Product.where(user_id: current_user.id).all
    @user = User.find(params[:user_id])


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
    @tracking_number = Sale.last.id
    @status = "Order awaiting to be confirmed"
    @user = current_user
    @product = Product.find(params[:product_id])
    @sale = @user.sales.new
    @sale.product = @product
    @sale.tracking_number = @tracking_number
    @sale.status = "Order awaiting to be confirmed"
    @sale.save
    redirect_to root_path
  end
  def update

    @sale.status =  params[:sale][:status]
    @sale.save



    redirect_to user_sales_path(current_user.id)
  end
  private

  def set_sale
    @sale  = Sale.find(params[:id])
  end

  def sale_params
    params.require(:sale).permit( :tracking_number, :status)
  end
end
