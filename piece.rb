PIECE_MOVES = {
  diagonal: [[-1, -1], [1, 1], [-1, 1], [1, -1]],
  horizontal: [[0, 1], [0, -1]],
  vertical: [[1, 0], [-1, 0]]
}


require_relative 'board'

class Piece
  
  attr_reader :name, :color, :moves, :pos, :board
  
  def initialize(name, color, pos, board)
    @name = name
    @color = color
    @pos = pos
    @board = board
  end
  
  def moves
    @moves = []
  end
  
end


module SlidingPiece
  def moves
    start_pos = self.pos
    @moves = []
    self.move_dirs.each do |direction|
      PIECE_MOVES[direction].each do |change|
        new_pos = [start_pos.first + change.first, start_pos.last + change.last]
        until !valid_move?(new_pos)
          # debugger
          @moves << new_pos
          break if board[new_pos].is_a?(Piece)
          new_pos = [@moves.last[0] + change.first, @moves.last[1] + change.last]
        end
      end
    end
    @moves
  end
      
  def valid_move?(pos)
    if pos.none? { |el| el < 0 } && pos.none? { |el| el > 7 }
      @board[pos] == "_" || @board[pos].color != self.color ? true : false
    end
  end
  
end

module SteppingPiece
end

module NullPiece 
end

class Bishop < Piece
  attr_reader :directions
  include SlidingPiece
  
  def move_dirs
    @directions = [:diagonal]
  end 

  
end 

class Rook < Piece 
  include SlidingPiece
  
  def move_dirs
    @directions = [:horizontal, :vertical]
  end 
  
end 

class Queen < Piece 
  include SlidingPiece
  
  def move_dirs
    @directions = [:vertical, :horizontal, :diagonal]
  end 
end

class Knight < Piece
end

class King < Piece
end

class Pawn < Piece
end
 