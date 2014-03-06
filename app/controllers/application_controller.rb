class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
#  before_action :authenticate_user!
  def all
    @transactions = User.find(params[:id]).transactions.reverse!
    cs = current_user.transactions.map { |t| t.credit.amount }
    @credits = cs.inject(:+)
  end
end
