class CartController < ApplicationController
    before_action :set_cart

    def index
        @cart_items = @cart.cart_items
    end

    # Add product to cart
    def add_product
        @cart.add_product(params[:product_id])
        redirect_to cart_path(@cart), notice: "Product added to cart."
    end

    # Show the checkout page
    def checkout
        @cart_items = @cart.cart_items.includes(:product)
        @total_price = @cart.total_price
    end

    private

    # Set or create a cart for the current session (typically use sessions or current_user)
    def set_cart
        if current_user.nil?
            redirect_to new_user_session_path, alert: "You need to log in to view your cart."
        else
            @cart = current_user.cart || current_user.create_cart
        end
    end
end
