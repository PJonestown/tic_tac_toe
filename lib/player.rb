class Player
	attr_reader :name, :marker 
	attr_accessor :turn
	def initialize(name, marker)
		@name = name
		@marker = marker
		@turn = false
	end

	def move
		print "Where would you like to move?"
		gets.to_i
	end

end