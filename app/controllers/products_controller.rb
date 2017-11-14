class ProductsController < ApplicationController

  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Products.all
  end

  def show
  end

  def new
    @product = Products.new
  end

  def create
    @product = Products.new(product_params)

    if @product.save
      redirect_to products_path
    else
      # GO BACK TO THE FORM
      render :new
    end
  end

  def edit
    @product = Products.find(params[:id])
  end

  def update
    @product = Products.find(params[:id])
    @product.update(product_params)

    redirect_to :back
  end

  def destroy
    @product = Products.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description)
  end

  def find_product
    @product = Products.find(params[:id])
  end
end
