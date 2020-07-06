class Api::V1::ProductsController < ApplicationController
  before_action :authenticate_user!
    
  def index
  	product = current_user.products
  	if product.present?
  		render json: {success: true,product: product}
  	else
  	  render json: {success: false, message:"somthing went wrong"}
  	end

  end 

  def create
    product = current_user.products.build(product_params)
    if product.save
    	render json: {success: true, product: product, message: "Successfully create product"}
    else
    	render json: {success: false, message:"somthing went wrong"}
    end
  end

  def destroy
  	product = Product.find(params[:id])
  	if product.present? && product.destroy
  		render json: {success: true, message: "Successfully deleted"}
  	else
  		render json: {success: false, message:"somthing went wrong"}
  	end
  end

  private

  def product_params
  	params.require(:product).permit(:model_number,:category,:dimensions,:style,:material,:other)
  end  
end