require_relative '../piece.rb'
require_relative 'sliding_piece.rb'

class Queen < Piece
  include SlidingPiece

  def symbol
    @color == :white ? "\u2655" : "\u265b"
  end
end
