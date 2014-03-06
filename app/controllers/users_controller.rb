class UsersController < ApplicationController
	before_filter :authenticate_user!

	def show
		@transactions = User.find(params[:id]).transactions.reverse!
	end
end