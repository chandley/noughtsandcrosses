class Square
	attr_accessor :status
	def initialize
		@status = :blank
	end
end

class Row
	attr_accessor :squares
	def initialize
		@squares = []
		(0..2).each {@squares.push Square.new}
	end
end

class Board
	attr_accessor :rows
	def initialize
		@rows = []
		(0..2).each {@rows.push Row.new}
	end
end

class Player 
	attr_accessor :name, :score, :token
	def initialize (name)
		@name = name
		@score = 0
		@token = @name[0].upcase
	end
end


class Game
	def initialize (player1, player2)
		@board = Board.new
		@player1, @player2 = player1, player2

	end

	def play (row, column, player)
		if @board.rows[row].squares[column].status == :blank 
		   @board.rows[row].squares[column].status = player
		else
		  return 'play again'
		end
	end

	def show_board
		@board.rows.each do |row|
			puts "-------"
			print "|"
			row.squares.each do |square|
				if square.status == :blank 
					print '-'
				else
					print square.status.token
				end
				print '|'
			end
			puts ''
		end
		puts "-------"
	end
end

mike = Player.new ('mike')
bob = Player.new ('bob')

my_game = Game.new bob, mike
my_game.show_board

my_game.play 1,1,bob
my_game.show_board

