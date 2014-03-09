class UsersController < ApplicationController
	before_filter :authenticate_user!

	def show
		@transactions = User.find(params[:id]).transactions.reverse!.paginate(page: params[:page], per_page: 15)
	end
end