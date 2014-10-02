class Square
	attr_accessor :status
	def initialize		
		@status = nil
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

	def show
		@rows.each do |row|
			puts "-------"
			print "|"
			row.squares.each do |square|
				print square.status.token rescue print '-'   # show '-' if status is nil
				print '|'
			end
			puts ''
		end
		puts "-------"
	end

	def check_3_in_row
	   victor_status = nil
	   #@rows.each {|row| victor_status = squares.first.status if (squares.each {|square| square.status}).uniq.length == 1 } # return player if rows match

	   #check cols
	   #check diags
	   return victor_status
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
	attr_accessor :board
	def initialize (player1, player2)
		@board = Board.new
		@player1, @player2 = player1, player2

	end

	def play (row, column, player)
		if @board.rows[row].squares[column].status.nil?
		   @board.rows[row].squares[column].status = player
		else
		  return 'play again'
		end
	end

	def test_victory
		if board.check_3_in_row.nil? 
			puts 'continue'
		else 
			puts "winner #{board.check_3_in_row.status.name}"
		end
	end
end

mike = Player.new ('mike')
bob = Player.new ('bob')

my_game = Game.new bob, mike

my_game.board.show

my_game.play 1,0,bob
my_game.play 0,2, mike
my_game.board.show
my_game.test_victory
my_game.play 1,1,bob
my_game.play 1,2,bob
my_game.board.show
my_game.test_victory


