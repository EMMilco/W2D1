require 'colorize'
require_relative 'cursor', 'board'

class Display

  def initialize(board)
    @board = board
    cursor = Cursor.new([4,4], board)
  end

  def render
    @grid.each do |row|
      puts row.join(" ".colorize(:background => :light_white))
    end
  end

end
