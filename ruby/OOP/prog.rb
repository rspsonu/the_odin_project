#Defines the TicTacToe class
class TicTacToe
	#Creates a board for each instance
	def initialize
		@board = []
		9.times { @board << " " }
		puts "A new board made: "
		puts "   |   |   "
		puts " 1 | 2 | 3 "
		puts "___|___|___"
		puts "   |   |   "
		puts " 4 | 5 | 6 "
		puts "___|___|___"
		puts "   |   |   "
		puts " 7 | 8 | 9 "
		puts "   |   |   "
		puts "Use start('x' or 'o') to start playing."
	end

	@win = false
	@draw = false
	$won = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

	#Starts the game. The whole game operates inside this method.
	def start(sign)
		@player = sign.upcase
		while !$win || !$draw
			place
			exit
			showBoard
			@win = checkWin
			@draw = checkDraw
			if @win == true
				puts "#{@player} wins!"
				puts "Wanna play again?(Y/n): "
				choice = gets.chomp
				if choice == "Y"
					initialize
				elsif choice == "n"
					return "Okay, goodbye."
				end
			elsif @draw == true
				puts "It's a draw."
				puts "Wanna play again?(Y/n): "
				choice = gets.chomp
				if choice == Y
					initialize
				else
					return "Okay, goodbye."
				end
			end
			changeTurn
		end
	end

	#Asks the player to choose a position to place his character.
	def place
		puts "#{@player}'s turn, Choose a place: "
		choice = gets.to_i
		if @board[choice-1] == " "
			@board[choice-1] = @player
		else
			puts "Place already occupied!"
			puts "Choose another place."
		end
	end

	#Shows the board and its content.
	def showBoard
		puts "   |   |   "
		puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
		puts "___|___|___"
		puts "   |   |   "
		puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
		puts "___|___|___"
		puts "   |   |   "
		puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
		puts "   |   |   "
	end

	#Checks wether a player has won or not.
	def checkWin
		$won.each do |val|
			check = 0
			val.each do |num|
				check += 1 if @board[num-1] == @player
				return true if check == 3
			end
		end
	end

	#Checks if the game has resulted in a draw.
	def checkDraw
		@board.each do |val|
			return false if val == " "
		end
		return true
	end

	#Changes the turn to next player.
	def changeTurn
		if @player == "X"
			@player = "O"
		else
			@player = "X"
		end
	end
end
