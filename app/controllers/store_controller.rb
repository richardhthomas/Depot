class StoreController < ApplicationController
  def index
    @products = Product.all
    # Record how many times the user has accessed the store's index page
    if session[:counter].nil?
      session[:counter] = 1
    else
      session[:counter] += 1
    end
    @counter = session[:counter]
  end
end
