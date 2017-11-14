class SalesController < ApplicationController

  before_action :set_sale, only: [:show]

  def index
    @sales = current_user.sales
  end

  def show
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.create(sale_params)

    redirect_to sale_path(sale)
  end

  private

  def set_sale
    @sale  = Sale.find(params[:id])
  end

  def sale_params
    params.require(:sale).permit(:user_id, :product_id, :tracking_number)
  end
end
