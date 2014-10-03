class Square
	attr_accessor :owner
	def initialize		
		@owner = nil
	end
end

class Board
	attr_accessor :squares
	def initialize
		@squares = []
		(0..2).each do |row|
			row = []
			(0..2).each {|col| row.push Square.new}
			@squares.push row
		end
	end
			
	def show
		@squares.each do |row|
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

	def check_3_in_row
	squares.each do |row|
		return row.first.owner if  row.map{|square| square.owner}.uniq.length == 1 
	end
	(0..squares.first.count).each do |col_index|
		col = squares.each {|row| row[col_index]}
		return col.first.owner if  col.map{|square| square.owner}.uniq.length == 1  rescue break
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
		if @board.squares[row][column].owner.nil?
		   @board.squares[row][column].owner = player
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

my_game.board.show



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
end
