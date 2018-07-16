class UsersController < ApplicationController
  # def show
  # 	@user = User.find(params[:id])
  # end

  # def new
  # 	@user = User.new
  # end

  # def create
  # 	@user = User.new(user_params)
  # 	if @user.save
  #     log_in @user 
  # 		@user.update_attribute(:user_type, "Manager")
  # 		flash[:success] = "Welcome to Bugzilla!"
  # 		redirect_to @user
  # 	else
  # 		render 'new'
  # 	end
  # end

  # private
  # 	def user_params
  # 		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  # 	end
end
