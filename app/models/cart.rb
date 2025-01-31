class Cart <ApplicationRecord
    belongs_to :user
    has_many :cart_items, dependent: :destroy
    has_many :products, through: :cart_items

    class CartsController < ApplicationController
        def checkout
            @cart_items = current_cart.items
            render "shared/_checkout"
        end
    end

    # Add product to the cart or update quantity
    def add_product(product_id)
        item = cart_items.find_by(product_id: product_id)
        if item
            item.increment(:quantity)
        else
            item = cart_items.build(product_id: product_id)
        end
        item.save
    end

    # Calculate total price of all items in the cart
    def total_price
        cart_items.includes(:product).map { |item| item.product.price * item.quantity }.sum
    end
end
