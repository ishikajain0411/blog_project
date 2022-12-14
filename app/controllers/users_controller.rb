class UsersController < ApplicationController
	def index
      @users = User.all
      #@users = current_arctiles.user
    end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to articles_path
			#redirect_to users_path
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
         @user = User.find(params[:id])
         if @user.update(user_params)
            redirect_to articles_path
         else
            render 'edit'
         end
    end

    def show
       @user = User.find(params[:id])
    end

	private
	def user_params
		params.require(:user).permit(:username,:email,:password)
	end
end
