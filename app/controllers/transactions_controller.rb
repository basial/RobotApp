class TransactionsController < ApplicationController
	before_filter :authenticate_user!

	def new
		@transaction = Transaction.new
	end

	def create
		
		begin
			if current_user.pay!(transaction_params)
				flash[:notice] = "Successful transaction"
				redirect_to root_path
			else
				create_dummy_transaction(transaction_params)
				flash[:notice] = "Transaction was not successful, please try again"
				render 'new'
			end
		rescue MyTransactionError => e
			create_dummy_transaction(transaction_params)
			flash[:notice] = e.message
			render 'new'
		end
	end

private
	def transaction_params
		params.require(:transaction).permit(:amount, :first_name, :last_name, :cc_number, :month, :year, :verification_value)
	end

	def create_dummy_transaction(p)
		@transaction = Transaction.new(p)
	end
end