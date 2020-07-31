class Api::V1::AddProjectsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_add_project, only: [:increge, :decrease, :remove_product]

	def increge
		quantity = @add_project.quantity + 1
		if @add_project.update(quantity: quantity)
			render_object(@add_project, 'add_project', "product add to project Successfully")
		else
			render_error("somthing went wrong")
		end	
	end

	def decrease
		quantity = @add_project.quantity - 1
		if quantity > 0
			if @add_project.update(quantity: quantity)
				render_object(@add_project, 'add_project', "product add to project Successfully")
			else
				render_error("somthing went wrong")
			end
		else
			render_error("Product quality must be at least One")
		end	
	end

	def remove_product
  	if @add_project.present? && @add_project.destroy
      render_destroy("Product has removed in Project Successfully")
  	else
      render_error("somthing went wrong")
  	end
	end

	private
  
  def find_add_project
  	@add_project = AddProject.where(product_id: params[:product_id],  project_id: params[:project_id]).first
  end

end
