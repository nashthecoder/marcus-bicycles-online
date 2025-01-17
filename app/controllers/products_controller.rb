class ProductsController < ApplicationController
  before_action :set_product, only: [ :show ]

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
    @product = Product.find_by(id: params[:id])
    unless @product
      redirect_to products_path, alert: "Product not found"
    end
  end
end
