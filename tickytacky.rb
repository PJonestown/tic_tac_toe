class Board
	attr_accessor :cells 
	attr_reader :winning_lines
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
		#go through all of board array and check if there are any integer values inside
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

class Player
	attr_reader :name 
	attr_reader :marker
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

	def winner?
	end

end


class Session

	def initialize
		new_name_setup
	end

	def get_legal_move
		loop do
			puts "#{@current_player.name}'s turn"
			player_choice = @current_player.move
			return player_choice if @board.cell_open?(player_choice)
			puts "INVALID MOVE"
		end
	end


	def who_goes_first
		rand < 0.5 ? @player_1.turn = true : @player_2.turn = false
		change_current_player
	end

	def change_current_player
		@player_1.turn ? @current_player = @player_1 : @current_player = @player_2
	end

	def play_game
		@board.draw
		loop do 
			game_tied if @board.no_moves_left?
			player_choice = get_legal_move
			@board.change_board(player_choice, @current_player.marker)
			@board.draw
			game_won
			@player_1.turn = @player_1.turn.!
			change_current_player
		end
	end

	def game_tied
		puts "\nUh oh, there are no moves left"
		play_again && exit
	end

	def new_name_setup
		#@current_player = nil
		#@board = Board.new
		puts "Welcome to the tic tac toe game"
		puts "Player 1, please enter your name"
		name = gets
		@player_1 = Player.new(name, 'X')
		puts "Player 2, Please enter your name"
		name = gets
		@player_2 = Player.new(name, 'O')
		same_name_setup
	end

	def same_name_setup
		@current_player = nil
		@board = Board.new # Probably need a reset METHOD

		puts "\nLet's begin"
		puts "#{@player_1.name} you will play as #{@player_1.marker}"
		puts "#{@player_2.name} you will play as #{@player_2.marker}"

		who_goes_first

		puts "\n\n Congratulations, #{@current_player.name}, you were randommly selected to go first\n\n"

		play_game
	end


	def play_again
		print "Would you like to play again (y/n)?"
		answer = gets.chomp.downcase
		if answer == 'y'
			same_name_setup
			initialize
		else
			puts "\nThanks for playing!"
			exit
		end
	end

	#TODO This is nasty
	#Clean up
	def game_won
		combos = [[0,1,2], [3,4,5], [6,7,8], 
							[0,3,6], [1,4,7], [2,5,8],
							[1,4,8], [6,4,2]					]
		i = 0
		combos.each do |n|
			n.each do |j|
				if @board.cells[j] != @current_player.marker
					break
				end
				i+=1
			end
			if i == 3 
				puts "Congrats #{@current_player.name} you are the WINNER"
				play_again
			else
				i = 0
			end
		end


	end


end

game = Session.new
