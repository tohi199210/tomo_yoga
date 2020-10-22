class UsersController < ApplicationController
	before_action :authenticate_user!
	def index
		@users = User.page(params[:page]).reverse_order
		@search_users = User.all.page(params[:page]).search(params[:search])
	end

	def show
		@user = User.find(params[:id])
		@posts = @user.posts
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
		redirect_to user_path(@user.id)
	    else
	     render :edit
	    end
	end

	def withdrawal_done
		@user = current_user
		@user.update(is_deleted:true)
		reset_session
		redirect_to root_path,info: 'ありがとうございました。またのご利用をお待ちしています。'
	end

	private

	def user_params
		params.require(:user).permit(:is_active, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :image, :introduction)
	end

end
