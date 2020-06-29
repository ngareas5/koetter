class Api::V1::SessionsController < Devise::SessionsController
	  skip_before_action :verify_signed_out_user
	  #skip_before_action :verify_authenticity_token
    
    def create
      user = User.find_by_email(params[:user][:email])
      if user.present? && user.valid_password?(params[:user][:password])
        token = Tiddle.create_and_return_token(user, request)
        render json: {success: true, user: user, authentication_token: token, message:" User Successfully Signed in" }
      else
        render json: {success: false, errors:"Email or Password is Invalid" }, status: :unprocessable_entity
      end
    end

    def destroy
      if current_user
        Tiddle.expire_token(current_user, request) 
        render json: {success: true, status: 200, message: "Successfully Signed Out"}
      else
        render json: {success: false, error: 'Invalid Token'}
      end
    end
end