class Transaction < ActiveRecord::Base	
  after_create :add_credits

	validates :amount, presence: true, numericality: true
	belongs_to :user
	has_one :credit
	attr_accessor :first_name, :last_name, :cc_number, :month, :year, :verification_value

protected
	def add_credits
    self.create_credit(amount: self.amount)
  end
end