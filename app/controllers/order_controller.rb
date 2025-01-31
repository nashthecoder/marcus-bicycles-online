class OrderController <ApplicationController
    def index
        @order_items = Order.all
    end
end
