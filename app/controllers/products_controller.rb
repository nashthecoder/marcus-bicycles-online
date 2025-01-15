class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show ]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
    @product = Product.find(params[:id])
  end

  private

  def set_product
    @product = Product.find(params[:id]) # For `show`, or
    # @product = Product.all # For `index`, or some other setup for both actions
  end
end
