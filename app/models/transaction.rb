class Transaction < ActiveRecord::Base	
  after_create :add_credits

	validates :amount, presence: true, numericality: true
	belongs_to :user
	has_many :credits
	attr_accessor :first_name, :last_name, :cc_number, :month, :year, :verification_value

protected
	def add_credits
    amount.to_i.times do credits.create(is_used: false); end 
  end
end