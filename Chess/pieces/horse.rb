require_relative '../piece.rb'

class Horse < Piece
  def symbol
    @color == :white ? "\u2658" : "\u265e"
  end
end
