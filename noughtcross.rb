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

	def check_3_in_row # this routine is not pretty!
	   victor = nil
	   @rows.each do |row|  # check rows
	   	  if (row.squares[0].status == row.squares[1].status && row.squares[1].status == row.squares[2].status)
	   	  	return victor = row.squares[0].status 
	   	  end
	   	end
	   	(0..2).each do |c|
	   		if rows[0].squares[c].status == rows[1].squares[c].status && rows[1].squares[c].status = rows[2].squares[c].status
	   			return victor = rows[0].squares[c].status 
	   		end
	   	end
	   	if rows[0].squares[0].status == rows[1].squares[1].status && rows[1].squares[1].status = rows[2].squares[2].status
	   		return victor = rows[0].squares[c].status 
	   	end
	   	if rows[0].squares[2].status == rows[1].squares[1].status && rows[1].squares[1].status = rows[2].squares[0].status
	   		return victor = rows[0].squares[c].status 
	   	end

	   return victor
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
	attr_accessor :board, :players
	def initialize (player1, player2)
		@board = Board.new
		@players = [player1, player2]

	end

	def play (row, column, player)
		if @board.rows[row].squares[column].status.nil?
		   @board.rows[row].squares[column].status = player
		else
		  return nil
		end
	end

	def test_victory
		if board.check_3_in_row.nil? 
			'continue'
		else 
			"winner #{board.check_3_in_row.name}"
		end
	end
end

mike = Player.new ('mike')
bob = Player.new ('bob')

my_game = Game.new bob, mike

loop do # add board is full check
	my_game.players.each do |player|
		puts "Player #{player.name} please enter row"
		row = gets.chomp.to_i
		puts 
		puts "Player #{player.name} please enter column"
		col = gets.chomp.to_i
		my_game.play(row,col,player)
		my_game.board.show
		if my_game.test_victory != 'continue'
			puts my_game.test_victory
			break
		end
	end
end




