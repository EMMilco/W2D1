require 'byebug'

require_relative 'piece'
require_relative 'exceptions'
require_relative 'pieces/bishop.rb'
require_relative 'pieces/horse.rb'
require_relative 'pieces/king.rb'
require_relative 'pieces/nullpiece.rb'
require_relative 'pieces/pawn.rb'
require_relative 'pieces/queen.rb'
require_relative 'pieces/rook.rb'


class Board
  attr_reader :grid

  def self.valid_pos?(pos)
    pos.all? { |coord| (0..7).cover?(coord) }
  end

  def initialize
    @grid =
      [[:R, :H, :B, :Q, :K, :B, :H, :R],
       [:P, :P, :P, :P, :P, :P, :P, :P],
       [nil, nil, nil, nil, nil, nil, nil, nil],
       [nil, nil, nil, nil, nil, nil, nil, nil],
       [nil, nil, nil, nil, nil, nil, nil, nil],
       [nil, nil, nil, nil, nil, nil, nil, nil],
       [:P, :P, :P, :P, :P, :P, :P, :P],
       [:R, :H, :B, :Q, :K, :B, :H, :R]]
    init_pieces
  end

  def init_pieces
    @grid.map!.with_index do |row,i|
      i < 5 ? color = :black : color = :white
      row.map.with_index do |col,j|
        case col
        when :R
          Rook.new(color, self, [i, j])
        when :H
          Horse.new(color, self, [i,j])
        when :B
          Bishop.new(color, self, [i,j])
        when :Q
          Queen.new(color, self, [i,j])
        when :K
          King.new(color, self, [i,j])
        when :P
          Pawn.new(color, self, [i,j])
        else
          NullPiece.instance
        end
      end
    end
  end

  def [](pos)
    x,y = pos
    @grid[x][y]
  end

  def []=(pos, val)
    x,y = pos
    @grid[x][y] = val
  end

  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    raise InvalidInputError if piece == NullPiece.instance
    raise InvalidInputError unless piece.valid_moves.include?(end_pos)
    self[start_pos] = NullPiece.instance
    self[end_pos] = piece
    piece.pos = end_pos
  end

  def in_check?(color)
    pieces = @grid.flatten
    king_pos = pieces.find { |piece| piece.is_a?(King) && piece.color == color }.pos

    pieces.any? do |piece|
      # debugger
      piece.moves.include?(king_pos)
    end
  end

  def checkmate?(color)
    pieces = @grid.flatten
    one_color_pieces = pieces.select { |piece| piece.color == color }

    in_check?(color) && one_color_pieces.all? do |piece|
      piece.valid_moves.empty?

    end
  end

  def dup
    new_board = Board.new

    new_board.grid = @grid.map do |row|
      row.map do |piece|
        piece == NullPiece.instance ? piece : piece.class.new(piece.color, new_board, piece.pos)
      end
    end

    new_board
  end


  protected

  attr_writer :grid

end
