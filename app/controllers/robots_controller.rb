class RobotsController < ApplicationController
	before_filter :authenticate_user!, only: [ :update ]
	rescue_from SystemCallError, with: :error
	
		def show
			# begin
				@prox = Robot.proximity
			# rescue  StandardError => e
			# 	flash[:error] = e.message
			# 	render 'show'
			# end
		end

		def update
			# begin
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
					flash[:error] = "Robot jest zablokowany"
					@prox = Robot.proximity
					render 'show'
				end
			# 	rescue  StandardError => e
			# 		flash[:error] = e.message
			# 		render 'show'
			# end
		end

private
	def error
		flash[:error] = "Error"
		render 'show'
	end
end