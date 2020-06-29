class ApplicationController < ActionController::Base
	skip_before_action :verify_authenticity_token
	protect_from_forgery with: :null_session

    def render_error(message)
	    render json: { message: message,success: false }, status: :unprocessable_entity
	end
end
