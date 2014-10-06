class Square
	attr_accessor :owner

	def initialize		
		@owner = nil
	end
end

class Board 
	attr_accessor :squares

	def initialize (size = 3)
		@squares = []
		(0..size-1).each do |row|
			row = []
			(0..size-1).each {|col| row.push Square.new}
			@squares.push row
		end
	end
		
	def blank_squares # count blank squares
		blanks = 0
		@squares.each do |row|
			row.each do |square| 
				if square.owner.nil? 
				 blanks += 1 
				end
			end
		end
		blanks
	end

	def show 
		squares.each do |row|
			puts "-------"
			print "|"
			row.each do |square|
				print square.owner.token rescue print '-'   # show '-' if owner is nil
				print '|'
			end
			puts ''
		end
		puts "-------"
	end

	def check_line_winner (*squares) 
		owners = squares.map {|square| square.owner}.uniq
		if owners.length == 1
			return owners.first
		else
			return nil
		end
	end

	def check_3_in_row
		squares.each do |row| # check rows
			winner = check_line_winner(*row) 
			return winner unless winner.nil?
		end
		(0..squares.length-1).each do |column| # check columns
			col_squares = []
			squares.each {|row| col_squares.push row[column]}
			winner = check_line_winner(*col_squares)
			return winner unless winner.nil?
		end
		#check diagonals
		winner = check_line_winner(squares[0][0], squares[1][1], squares[2][2])
		return winner unless winner.nil?
		winner = check_line_winner(squares[2][0], squares[1][1], squares[0][2])
		return winner unless winner.nil?
		return nil
	end
		
end

class Player 
	attr_accessor :name, :score, :token
	def initialize (name)
		@name = name
		@score = 0
		@token = @name[0].upcase # this is what we show on board
	end
end

class Game
	attr_accessor :board, :players, :winner
	def initialize (player1, player2)
		@board = Board.new
		if player1.token == player2.token then player2.token.downcase! end
		@players = [player1, player2]
		@winner = nil
		
	end
  
	def move player
		played_square = nil
		while played_square == nil do
			puts "Player #{player.name} please enter row"
			row = gets.chomp.to_i
			puts "Player #{player.name} please enter column"
			column = gets.chomp.to_i			
			puts "Can't play there - try again" unless played_square = play(row, column, player)
		end
		@winner = board.check_3_in_row
	end

	def play (row, column, player) 
		if @board.squares[row][column].owner.nil?
		   @board.squares[row][column].owner = player
		else
		  return nil # square already taken
		end
	end
end

#################main loop ###################################
mike = Player.new ('mike')
bob = Player.new ('bob')

my_game = Game.new bob, mike

while my_game.winner.nil? && my_game.board.blank_squares >= 1 do
	my_game.players.each do |player|
		my_game.board.show
		my_game.move player 
		break unless my_game.winner.nil? && my_game.board.blank_squares >= 1 # clumsy to repeat test
	end
end
my_game.board.show
if my_game.winner.nil?
	puts "stalemate"
else
	puts "congratulations #{my_game.winner.name} - you are the winner" 
end
