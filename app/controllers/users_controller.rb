class UsersController < ApplicationController
    def new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to "/game/main"
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to "/sessions/new"
        end
    end
    
    def gender
        @user = User.find(current_user.id)
        @user.gender = params[:gender]
        @user.save
        puts @user
        redirect_to "/game/choose"
    end
    
    private
    def user_params
        params.require(:user).permit(:name, :gender, :password)
    end
end
