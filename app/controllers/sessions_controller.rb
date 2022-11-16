class SessionsController < ApplicationController
    def new
        @user = User.new
        render :new 
    end

    def create #use the methods defined earlier in the users controller
        incoming_email = params[:user][:email]
        incoming_pw = params[:user][:password]
        @user = User.find_by_credentials(incoming_email, incoming_pw)
        if @user 
            login_user(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = ["no user"]
            render :new
        end
    end

    def destroy 
        logout
        redirect_to new_session_url 
    end
end