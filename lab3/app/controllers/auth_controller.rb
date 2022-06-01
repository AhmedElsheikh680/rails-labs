class AuthController < ApplicationController
  # to make authentication for specific function and run before enter function
  before_action :authenticated_user , only: [:signin_form]
  def signup_form
    @user=User.new
  end

  def register
    @user=User.new(params.require(:user).permit(:name , :email ,:password,:password_confirmation))
    return redirect_to signin_path if @user.save
    render 'auth/signup_form'
  end

  def signin_form
    #we must check if session opened or not before enter login form
      # if session[:login]
      #   return redirect_to root_path
      # else
      #   return redirect_to login_path
      # end
    #or can but the previous condition in application controller and use the function you create in it
      # authenticate_user
  end
  def login
    user=User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user]=user.id
      return redirect_to root_path
    else
      redirect_back fallback_location: login_path , notice: 'invalid user'
    end
  end
  
  def logout
    session.delete(:user)
    return redirect_to signin_path
  end
end
