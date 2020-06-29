class Api::V1::UsersController < ApplicationController
	#skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
 
  def update
    if current_user.present? && current_user.update(user_params)
      render json: {success: true, user: current_user, message: "Successfully updated user"}
    else
      #render json: {success: false, user: current_user, message: current_user.errors.full_messages.to_sentence}
      render json: {success: false, message:"somthing went wrong"}
    end
  
  # def destroy 

  # end 

  private

  def user_params
    params.require(:user).permit(:email, :password, :username)
  end
end