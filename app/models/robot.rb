class Robot 
	def self.move(command)
		if [:forward, :backward, :slow_forward, :slow_backward, :left, :right, :run, :attack].include?(command)
			Move.send command
		end
	end

	def self.lock
		response = Move.lock
		# debugger		
			if response == "OK" || response == "API locked by #{API_KEY}"
				return true
			else
				return false
			end
	end

	def self.proximity
		return Move.proximity
	end
end