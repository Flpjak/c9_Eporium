class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
   
  protect_from_forgery with: :exception
  
  private
  def initialize_cart
    if session[:cart_id] and Cart.exists?(session[:cart_id])
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end
end
