class UserController < ApplicationController
    include BCrypt
    protect_from_forgery
    
    def self.checkEmail(username_or_email="")
      user = User.find_by_email(username_or_email)
      if user
        return true
      else
        return false
      end
    end

    def self.checkUser(username_or_email="")
      user = User.find_by_name(username_or_email)
      if user
        return true
      else
        return false
      end
    end

    def self.authenticate(username_or_email="", login_password="")
      if  URI::MailTo::EMAIL_REGEXP.match(username_or_email)    
        user = User.find_by_email(username_or_email)
      else
        user = User.find_by_username(username_or_email)
      end
      # TODO: Fix user.pass not matching login_password
      if user && user.pass == login_password
        return user
      else
        return false
      end
    end

    def index
      @users = User.all
    end 

    # POST /user
    def create
      @user = self.class.authenticate(login_params[:email], login_params[:pass])

      # saves the article to the database 
      if @user
          redirect_to '/'
      else
          flash[:login_error] = ['Invalid credentials']
          redirect_to '/account'
      end
    end
  
    def new
      if self.class.checkUser(user_params[:name]) || self.class.checkEmail(user_params[:email])
        flash[:error] = "User already exists"
        redirect_to '/account/register'
      else
        @user = User.new(user_params)
        @user.pass = BCrypt::Password.create(user_params[:pass])
        if @user.save
          session[:user_id] = @user.id
          redirect_to '/'
        else
          flash[:error] = @user.errors.full_messages
        end
      end
    end

  private
  def user_params
      params.require(:register).permit(:name, :email, :pass)
  end
  def login_params
      params.require(:login).permit(:email, :pass)
  end
end
