require 'singleton'

class Piece

  attr_reader :color
  attr_accessor :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def valid_moves
    moves
  end

end
