require_relative '../piece.rb'
require_relative 'sliding_piece.rb'

class Rook < Piece
  include SlidingPiece

  def symbol
    @color == :white ? "\u2656" : "\u265c"
  end

  def move_dirs
    HORIZONTAL_DIRS
  end
end
