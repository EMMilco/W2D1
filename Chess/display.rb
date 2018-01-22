require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([4,4], board)
  end

  def render
    @board.grid.each do |row|
      puts row.join(" ".colorize(:background => :light_white))
    end
    @cursor.get_input
  end

end
