class UserController < ApplicationController
    include BCrypt
    
    def index
        @user = User.find_by_email(params[:email])
        if @user.password == params[:password]
          give_token
        else
          redirect_to home_url
        end
    end

    def create
        @user = User.new(params[:name])
        @user.password = params[:pass]
        @user.save!
    end

    def show
    end
    
end
