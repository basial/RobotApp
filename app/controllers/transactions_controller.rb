class TransactionsController < ApplicationController
	before_filter :authenticate_user!

	def new
		@transaction = Transaction.new
	end

	def create
		@transaction = current_user.transactions.new(transaction_params)
		@credit_card = ActiveMerchant::Billing::CreditCard.new(
                :first_name         => params[:transaction][:first_name],
                :last_name          => params[:transaction][:last_name],
                :number             => params[:transaction][:cc_number],
                :month              => params[:transaction][:month],
                :year               => params[:transaction][:year],
                :verification_value => params[:transaction][:verification_value])
	
		if @credit_card.valid? && @transaction.valid?
			@response = GATEWAY.purchase(@transaction.amount, @credit_card)
			if @response.success? && @transaction.save
				flash[:notice] = "Successful transaction"
				redirect_to root_path
			else
				flash[:notice] = "Transaction was not successful, please try again"
				render 'new'
			end
		else
			flash[:error] = "Credit card is not valid"
			render 'new'
		end
	end

private
	def transaction_params
		params.require(:transaction).permit(:amount, :first_name, :last_name, :cc_number, :month, :year, :verification_value)
	end
end