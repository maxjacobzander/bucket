class ApplicationController < ActionController::Base

    def require_login  
        redirect_to '/users/sign_in' unless !current_user.nil?
    end

    # before_action :authenticate_user!
    # user_signed_in?
    
end
