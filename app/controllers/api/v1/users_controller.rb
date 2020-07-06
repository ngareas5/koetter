class Api::V1::UsersController < ApplicationController
	skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, except: [:forgot_password,:reset_password]
 
  def update
    if current_user.present? && current_user.update(user_params)
      render json: {success: true, user: current_user, message: "Successfully updated user"}
    else
      #render json: {success: false, user: current_user, message: current_user.errors.full_messages.to_sentence}
      render json: {success: false, message:"somthing went wrong"}
    end
  end
  

  def forgot_password
    user = User.find_by_email(params[:user][:email])
    if user.present?
      user.generate_password_token!
      UserMailer.sendMail(user).deliver
      render json: {status: :ok}
    else
      render json: {success: false, errors:"Email address not found " }, status: :not_found
    end
  end
  
  def reset_password
    token = params[:token].to_s
    if params[:email].blank?
      return render json: {success: false, errors:"token not found"}
    end

    user = User.find_by(reset_password_token: token)
    if user.present? && user.password_token_valid?
      if user.reset_password!(params[:password])
        render json: {status: :ok}
      else
        render json: {error: user.errors.full_messages}, status: :unprocessable_entity
      end
    end

  end
  
  private

  def user_params
    params.require(:user).permit(:email, :password, :username)
  end
end