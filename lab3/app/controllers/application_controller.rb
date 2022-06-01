class ApplicationController < ActionController::Base
    def authenticated_user
        return redirect_to root_path if session[:user]
        
    end
    def unauthenticated_user
        return redirect_to signin_path unless session[:user]
    end
end
