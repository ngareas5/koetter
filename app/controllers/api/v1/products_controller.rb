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

  def search_product
    product = Product.where('categories like ? OR width like ? OR architectural_style like ?', "%#{params[:categories]}%","#{params[:width]}%", "#{params[:architectural_style]}")
    if product.present?
      render json: {success: true, product: product, message: "Successfully serach product"}
    else
      render json: {success: false, message:"Product not found"}
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
  
  def find_project
    @project = Project.find(params[:id])
  end

  def product_params
  	params.require(:product).permit(:part, :thickness, :width, :length, :metric, :customer_id, :customer, :manufacturer, :categories, :other_category,:product_use,:picture_link, :degree,:item_class,:custom_species, :stock_species, :architectural_style, :search_words ,:archedknives,:bentwoodknives,:carbideknives,:drawer,:dwg_revised,:steelknives, :knives, :uom,:item,:category1id,:category2id,:sort_by_store,:sort_by_likes,:flatbend ,:verified, :published,:revised)
  end 


end