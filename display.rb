require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display
  attr_reader :cursor
  
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end 
  
  def render
    system("clear")
    puts "  0 1 2 3 4 5 6 7"
    @board.grid.each_with_index do |row, x|
      print "#{x}|"
      row.length.times do |y|
        if cursor.cursor_pos == [x, y]
          print '_'.colorize(background: :red) + "|"
        else
          print "_|"
      # puts "#{i}|#{row.join("|")}|"
        end
      end
      puts
    end
  end
    
  def render_loop
    while true
      render
      @cursor.get_input
    end
  end
end 

board = Display.new(Board.new)
board.render_loop
