require_relative '../piece.rb'

class Pawn < Piece
  def symbol
    @color == :white ? "\u2659" : "\u265f"
  end

  MOVE_DIFFS = { :white => [[-1,1], #the first three are open to white pawns
                            [0,1],
                            [1,1]],
                 :black => [[-1,-1],
                            [0,-1],
                            [1,-1]] }



  def moves
    valid_moves = []

    MOVE_DIFFS[@color].each.with_index do |pos_diff, index_in_pos_diff_subarray|
      next_pos = @pos.map.with_index { |coord, idx| coord + pos_diff[idx] }

      next unless Board.valid_pos?(next_pos) # don't move off the board

      case index_in_pos_diff_subarray
      when 0,2 # only move diagonally if enemy piece exists
        if @board[next_pos].color != @color && @board[next_pos].color != nil
          valid_moves << next_pos
        end
      when 1 # only move forward if empty
        valid_moves << next_pos if @board[next_pos].color.nil?
      end
    end
    valid_moves
  end

end
