class RobotsController < ApplicationController
	before_filter :authenticate_user!, only: [ :update ]
	rescue_from SystemCallError, with: :serv_error

	def update
		@prox = Robot.proximity
		if current_user.has_active_credit?
				run_robot
		else
			if current_user.has_credits?
				run_robot
				current_user.bill!
			else
				flash[:error] = 'Buy more credits to play with the robot!'
				render 'show'
			end
		end
	end

private
	def serv_error
		redirect_to error_path
	end

	def run_robot
		if Robot.lock
			if params[:commands]
				params[:commands].scan(/forward|backward|slow_forward|slow_backward|left|right|run|attack/).each do |command|
					Robot.move(command.to_sym)
				end
			else
		 		Robot.move(params[:do].to_sym)
			end
			redirect_to :back
		else
			flash[:error] = 'Robot is locked by another user, please try again in 60 sec'
			@prox = Robot.proximity
			render 'show'
		end
	end
end