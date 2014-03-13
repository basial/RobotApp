class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :send_mail
  has_many :transactions 

  def pay!(params)
  	@transaction = self.transactions.new(params)
  	credit_card = ActiveMerchant::Billing::CreditCard.new(
                :first_name         => params[:first_name],
                :last_name          => params[:last_name],
                :number             => params[:cc_number],
                :month              => params[:month],
                :year               => params[:year],
                :verification_value => params[:verification_value])

	  raise MyTransactionError.new("cc not valid") if !credit_card.valid? 
	  raise MyTransactionError.new("transaction not valid") if !@transaction.valid?
	  	
		response = GATEWAY.purchase(@transaction.amount*100, credit_card)	
    @transaction.credits = @transaction.amount
		if (response.success? && @transaction.save)
      self.credits += @transaction.amount
      if self.first_name.blank? || self.last_name.blank?
        self.first_name = params[:first_name]
        self.last_name = params[:last_name]
      end

      self.save
      UserMailer.credits_mail(self.email, @transaction.credits).deliver
      return true
    end
	end

  def bill!
    self.credits -= 1 
    self.paid_at = Time.now
    transactions.build(amount: 0, credits: -1, user: self)
    save
  end

  def has_credits?
    credits > 0
  end

  def has_active_credit?
    paid_at && Time.now - paid_at < 60.seconds
  end

private
  def send_mail
    UserMailer.welcome_mail(self.email).deliver
  end
end
