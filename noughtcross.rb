class Square
	attr_accessor :status
	def initialize
		@status = :blank
	end
end

class Row
	attr_accessor :cells
	def initialize
		@cells = []
		(0..2).each {@cells.push Square.new}
	end
end

class Board
	attr_accessor :rows
	def initialize
		@rows = []
		(0..2).each {@rows.push Row.new}
	end
end

class Game

	def initialize
		@board = Board.new
	end

end

