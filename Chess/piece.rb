require 'singleton'

class Piece

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def symbol
    self.class.to_s.first
  end

  def to_s
    self.class.to_s.first.colorize(@color)
  end

end


class Rook < Piece
end

class Horse < Piece
end

class Bishop < Piece
end

class Queen < Piece
end

class King < Piece
end

class Pawn < Piece
end

class NullPiece < Piece
  include Singleton

  def initialize

  end
end
