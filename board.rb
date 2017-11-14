require_relative "piece"
require 'byebug'
require_relative "cursor"

# PIECES = {
#   pawn: ♟,
#   rook: ♜,
#   bishop: ♝,
#   knight: ♞,
#   king: ♚,
#   queen: ♛
# }

class NoPieceError < StandardError
  def message
    puts "There is no piece at this start position"
  end
end

class CannotMoveError < StandardError
  def message 
    puts "This piece can't move to that position."
  end 
end 

class Board
  attr_reader :grid
  
  def initialize(grid = Array.new(8) { Array.new(8) { "_" } })
    @grid = grid
    make_starting_grid
  end
  
  def [](pos)
    row, col = pos
    @grid[row][col]
  end
  
  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end
     
  def dup()
  end
  
  def move_piece!(start_pos, end_pos)
    if self[start_pos].is_a?(Piece) && self[end_pos] == "_"
      self[end_pos] = self[start_pos]
      self[start_pos] = "_" 
    elsif self[start_pos] == "_"
      raise NoPieceError
    elsif self[end_pos] != "_" 
      raise CannotMoveError
    end 
      self
      
  end
  
  def checkmate?
    
  end
  
  def in_bounds?(pos)
    row, col = pos
    # row < @grid.length && col < @grid.length && row >= 7 && col >= 0
    pos.all? { |el| el.between?(0, @grid.length - 1) }
  end
  
  def make_starting_grid
    (0..1).each do |row|
      (0..7).each do |col|
        pos = [row, col]
        if row == 0
          if col == 0 || col == 7
            self[pos] = Rook.new(:rook, :black, pos, self)
          elsif col == 1 || col == 6
            self[pos] = Knight.new(:knight, :black, pos, self)
          elsif col == 2 || col == 5
            self[pos] = Bishop.new(:bishop, :black, pos, self)
          elsif col == 3
            self[pos] = King.new(:king, :black, pos, self)
          else
            self[pos] = Queen.new(:queen, :black, pos, self)
          end
        else
          self[pos] = Pawn.new(:pawn, :black, pos, self)
        end
      end
    end
    (6..7).each do |row|
      (0..7).each do |col|
        pos = [row, col]
        if row == 7
          if col == 0 || col == 7
            self[pos] = Rook.new(:rook, :white, pos, self)
          elsif col == 1 || col == 6
            self[pos] = Knight.new(:knight, :white, pos, self)
          elsif col == 2 || col == 5
            self[pos] = Bishop.new(:bishop, :white, pos, self)
          elsif col == 3
            self[pos] = King.new(:king, :white, pos, self)
          else
            self[pos] = Queen.new(:queen, :white, pos, self)
          end
        else
          self[pos] = Pawn.new(:pawn, :white, pos, self)
        end
      end
    end
    self  
  end
  
  protected

  
  def find_king(color)
  end
end