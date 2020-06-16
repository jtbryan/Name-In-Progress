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
        user = User.find_by_name(username_or_email)
      end
      if user && BCrypt::Password.new(user.pass) == login_password
        return user
      else
        Rails.logger.debug "User failed login: #{user}"  # view this in log/development.log
        return false
      end
    end

    def index
      @users = User.all
    end 

    # POST /user
    def create
      @user = self.class.authenticate(login_params[:email], login_params[:pass])
 
      if @user
          valid = BCrypt::Password.create("true")
          redirect_to account_path(@user, register: valid)
      else
          flash[:login_error] = ['Invalid credentials']
          redirect_to '/account'
      end
    end
  
    def new
      if user_params[:pass] != user_params[:confirm_pass]
        flash[:error] = "Passwords do not match"
        redirect_to '/account/register'
      elsif self.class.checkUser(user_params[:name]) || self.class.checkEmail(user_params[:email])
        flash[:error] = "User already exists"
        redirect_to '/account/register'
      else
        @user = User.new(user_params.except(:confirm_pass))
        @user.pass = BCrypt::Password.create(user_params[:pass])
        if @user.save
          valid = BCrypt::Password.create("true")
          redirect_to account_path(@user, register: valid)
        else
          flash[:error] = @user.errors.full_messages
        end
      end
    end

    def show
      if session[:user_id2] != nil
        @user = User.find(params[:id])
        session[:user_id2] = @user.id
      elsif request.GET.values.length > 0
        if BCrypt::Password.new(request.GET.values[0]) != "true"
          redirect_to request.referer
        end
        @user = User.find(params[:id])
        session[:user_id2] = @user.id
      else
        redirect_to("/account")
      end
    end

    # POST /user/id
    def update
      @user = User.find(params[:user_id])
      @user.name = params[:newname]
      @user.email = params[:newemail]
      @user.save
      redirect_to request.referer
    end 

    def logout
      session[:user_id2] = nil
      redirect_to("/")
    end 

  private
  def user_params
      params.require(:register).permit(:name, :email, :pass, :confirm_pass)
  end
  def login_params
      params.require(:login).permit(:email, :pass)
  end
end
