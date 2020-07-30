class Api::V1::ProductsController < ApplicationController
  before_action :authenticate_user!
    
  def index
  	product = current_user.products
  	if product.present?
      render_collection(product, 'product', Product , "Products found successfully")
  	else
      render_error("Unable to find Products")
  	end
  end

  def search_product
    product = Product.where('categories like ? OR width like ? OR architectural_style like ?', "%#{params[:categories]}%","#{params[:width]}%", "#{params[:architectural_style]}")
    if product.present?
      render_collection(product, 'product', Product , "Successfully serach product")
    else
      render_error("Product not found")
    end
  end 

  def create
    product = current_user.products.build(product_params)
    if product.save
      render_object(product, 'product', "Successfully create product")
    else
      render_error("somthing went wrong")
    end
  end

  def destroy
  	product = Product.find(params[:id])
  	if product.present? && product.destroy
      render_destroy("Successfully deleted")
  	else
      render_error("somthing went wrong")
  	end
  end

  def add_to_project
    unless check_new_project.present?
      unless check_product.present?
        add_project = AddProject.new(product_id: params[:product_id], project_id: params[:project_id], quantity: params[:quantity])
        if add_project.save
          render_object(add_project, 'add_project', "product add to project Successfully")
        else
          render_error(add_project.errors.full_messages)
        end  
      else
        render_error("You are alredy added this product")
      end
    else
      unless check_product.present?
        project = Project.new(project_name: params[:project_name], user_id: current_user.id)
        if project.save
          add_project = AddProject.new(product_id: params[:product_id], project_id: project.id, quantity: params[:quantity])
          if add_project.save
            render_object(add_project, 'add_project', "product add to project Successfully")
          else
            render_error(add_project.errors.full_messages)
          end
        else
          render_error(project.errors.full_messages)
        end  
      else
        render_error("You are alredy added this product")
      end 
    end       
  end

  private
  
  def find_project
    @project = Project.find(params[:id])
  end

  def check_product
    AddProject.where(product_id: params[:product_id],  project_id: params[:project_id])
  end

  def check_new_project
    project_name = params[:project_name]
  end

  def product_params
  	params.permit(:part, :thickness, :width, :length, :metric, :customer_id, :customer, :manufacturer, :categories, :other_category,:product_use,:picture_link, :degree,:item_class,:custom_species, :stock_species, :architectural_style, :search_words ,:archedknives,:bentwoodknives,:carbideknives,:drawer,:dwg_revised,:steelknives, :knives, :uom,:item,:category1id,:category2id,:sort_by_store,:sort_by_likes,:flatbend ,:verified, :published,:revised, :project_id)
  end 

end