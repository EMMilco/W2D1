require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([4,4], board)
  end

  def render

    loop do
      system("clear")
      colored_board = @board.grid.map.with_index do |row, i|
        row.map.with_index do |piece, j|
          if [i,j] == @cursor.cursor_pos
            " #{piece.symbol} ".colorize(:background => :light_red)
          elsif (i + j).even?
            " #{piece.symbol} ".colorize(:background => :light_white)
          else
            " #{piece.symbol} ".colorize(:background => :light_black)
          end
        end
      end

      colored_board.each do |row|
        puts row.join
      end

    break if @cursor.cursor_pos == @cursor.get_input
    end
  end

end
