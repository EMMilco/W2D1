require_relative '../piece.rb'

class Bishop < Piece
  def symbol
    @color == :white ? "\u2657" : "\u265d"
  end
end
