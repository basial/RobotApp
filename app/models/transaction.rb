class Transaction < ActiveRecord::Base	
	validates :amount, presence: true, numericality: true
	belongs_to :user
	attr_accessor :first_name, :last_name, :cc_number, :month, :year, :verification_value
end