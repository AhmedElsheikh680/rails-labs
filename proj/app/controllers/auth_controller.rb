class AuthController < ApplicationController
  before_action :authenticated_user, except: [:logout]
  layout 'auth'
  def registeration
    render 'registration'
  end

  def signup
    #store in db
    #1-get data from request
    # puts params
    #validation
    #store data
    #redirect
   user=User.new(params.permit(:name ,:email ,:password))
    return redirect_to root_path   if user.save
      redirect_back fallback_location: registration_path
end

  def signin_form
  end

  def signin
   user = User.find_by(email: params[:email])
   if user && user.authenticate(params[:password])
      session[:user] = user
      return redirect_to root_path
   else
    redirect_back fallback_location: login_path
    end

  end
  def logout
    session[:user] = nil 
    redirect_to login_path
    
  end
end
