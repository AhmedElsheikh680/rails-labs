class ApplicationController < ActionController::Base
    def unauthenticated_user
        return redirect_to login_path unless session[:user]
        # redirect_to root_path
        # if !session[:user]
            
        # end
        
    end
    def authenticated_user
        return redirect_to root_path if session[:user]
        # redirect_to root_path
        # if !session[:user]
            
        # end
        
    end
end
