class UsersController < ApplicationController
	before_filter :authenticate_user!

	def show
		@transactions = User.find(params[:id]).transactions.reverse!
    cs = current_user.transactions.map { |t| t.credit.amount }
    @credits = cs.inject(:+)
	end
end