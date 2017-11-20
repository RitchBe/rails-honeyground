class ProductsController < ApplicationController

  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
    @user = User.find(params[:user_id])

  end

  def new
    @user = User.find(params[:user_id])

    @location = Location.new
  end

  def create
    @user = User.find(params[:user_id])
    @product = @user.products.new(product_params)
    if @product.save
      redirect_to user_path(@user.id)
    else
      # GO BACK TO THE FORM
      puts "not working"
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])

    @product = Product.find(params[:id])
  end


  def update
    @product = Product.find(params[:id])
    @product.update(product_params)

    redirect_to :back
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to user_path(current_user.id)
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :user_id, :photo)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end


