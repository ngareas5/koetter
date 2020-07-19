class Api::V1::RegistrationsController < Devise::RegistrationsController

    before_action :configure_permitted_parameters
    #skip_before_action :verify_authenticity_token, :only => [:create]
     # this action isa for Register User or Sign up

    def create
    	ActiveRecord::Base.transaction do
        build_resource(sign_up_params)
        if resource.blank?
          render json: {success: false, message: "params not present"}
        else
          resource.save
        end
          @user = resource
          token = Tiddle.create_and_return_token(@user, request)
          render json: { success: true, user: @user.as_json.merge({token: token}), message: "User created successfully"}      
      end
    end
      
  protected

    def configure_permitted_parameters
       param_keys = [:email, :password, :username, :business_address_line_1, :business_address_line_2, :city, :zip_code, :state,:telephone, :fax]
       devise_parameter_sanitizer.permit(:sign_up, keys: param_keys)
    end
    def resource_name
       :user
    end
end
