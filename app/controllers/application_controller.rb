class ApplicationController < ActionController::Base
  before_action :set_cart
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private

  def set_cart
    if user_signed_in?
      @cart = current_user.cart || current_user.create_cart
    end
  end
end
