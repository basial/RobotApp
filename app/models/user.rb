class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :transactions
  after_create :add_init_credits

  def payment!(params)
  	transaction = self.transactions.new(params)
 # 	debugger
  	credit_card = ActiveMerchant::Billing::CreditCard.new(
                :first_name         => params[:first_name],
                :last_name          => params[:last_name],
                :number             => params[:cc_number],
                :month              => params[:month],
                :year               => params[:year],
                :verification_value => params[:verification_value])

	  raise MyTransactionError.new("cc not valid") if !credit_card.valid? 
	  raise MyTransactionError.new("transaction not valid") if !transaction.valid?
	  	
		response = GATEWAY.purchase(transaction.amount, credit_card)			
		return (response.success? && transaction.save)
	end

protected
  def add_init_credits
    self.transactions.new(amount: 2)
  end
end
