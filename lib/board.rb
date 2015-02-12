class Board
	attr_accessor :cells 
	
	def initialize
		@cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
	end

	def draw
		@cells.each_with_index do |val, index|
			print " | " + val.to_s
			unless (index + 1) % 9 == 0
				print "|\n   _   _   _\n" if (index + 1) % 3 == 0
			end
		end
		puts "\n\n"
	end


	def no_moves_left?
		@cells.each do |n|
			if n.is_a? Numeric
				return false
			end
		end
		true
	end

	def cell_open?(choice)
		if @cells[choice - 1] == choice
			true
		else 
			false
		end
	end

	def change_board(choice, marker)
		@cells[choice - 1] = marker
	end

end