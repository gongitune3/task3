class UsersController < ApplicationController
    before_action :authenticate_user!

    def top
    end
    
    def index
        @users = User.all
        @user = User.new
        @book = Book.new
        @myuser = User.find(params[:id])
    end

    def show
        @user = User.find(params[:id])
        @books = Book.all
        @book =  Book.new
    end

    def edit
        @user = User.find(params[:id])
        if  @user.id != current_user.id
            redirect_to user_path(current_user)
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "You have updated book successfully."
            redirect_to user_path(@user.id)
        else
            render :edit
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :profile_image, :introduction)
    end
end
