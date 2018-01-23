require_relative '../piece.rb'
require_relative 'sliding_piece.rb'

class Bishop < Piece
  include SlidingPiece

  def symbol
    @color == :white ? "\u2657" : "\u265d"
  end

  def move_dirs
    DIAGONAL_DIRS
  end
end
