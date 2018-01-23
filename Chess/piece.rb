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
    valid_moves = moves.reject do |move|
      duped_board = @board.dup
      parallel_piece = duped_board[@pos]
      duped_board[move] = parallel_piece
      duped_board[@pos] = NullPiece.instance
      duped_board.in_check?(@color)
    end
    valid_moves
    # debugger
  end

end
