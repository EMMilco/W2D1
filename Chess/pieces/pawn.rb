require_relative '../piece.rb'

class Pawn < Piece
  def symbol
    @color == :white ? "\u2659" : "\u265f"
  end
end
