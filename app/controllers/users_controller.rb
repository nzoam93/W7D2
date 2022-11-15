class UsersController < ApplicationController
    def show
        @user = User.find_by(id: params[:id])
        render :show 
    end

    def create
        @user = User.new(user_params)
        if @user.save 
            redirect_to user_url(@user)
        else
            render json: @cat.errors.full_messages, status: 422
        end
    end

    def new 
        @user = User.new
        render :new 
    end

    private 
    def user_params 
        params.require(:user).permit(:email, :password_digest, :session_token)
    end
end