class Api::V1::OrderHistoriesController < ApplicationController
  before_action :authenticate_user!

  def create
    order_history = current_user.order_histories.build(order_params)
    if order_history.save
    	order_history.update(order_date: Date.now)
    end
  end
  
  private

  def order_params
  	params.require(:order_history).permit(:order_id,:order_date,:status)
  end  
     
end