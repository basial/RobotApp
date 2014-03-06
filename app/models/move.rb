require 'open-uri'

class Move 
	@@url = "#{URL_ROBOT}#{API_KEY}/" 

	def self.lock
		url = @@url + "lock"
		open(url).read
	end

	def self.proximity
		url = "#{URL_ROBOT}proximity"
		open(url).read
	end

	def self.forward
		url = @@url + "forward"
		open(url).read
	end

	def self.backward
		url = @@url + "backward"	
		open(url).read
	end

	def self.slow_forward
		url = @@url + "slow_forward"
		open(url).read
	end

	def self.slow_backward
		url = @@url + "slow_backward"		
		open(url).read
	end

	def self.left
		url = @@url + "left"
		open(url).read	
	end

	def self.right
		url = @@url + "right"
		open(url).read		
	end

	def self.run
		url = @@url + "run"
		open(url).read		
	end

	def self.attack
		url = @@url + "attack"
		open(url).read		
	end
end
