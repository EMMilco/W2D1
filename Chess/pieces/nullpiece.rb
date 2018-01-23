require 'singleton'

class NullPiece
  include Singleton

  attr_reader :color

  def initialize

  end

  def symbol
    " "
  end

  def valid_moves
    []
  end

  def moves
    []
  end

end
