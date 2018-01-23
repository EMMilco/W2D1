require 'singleton'

class NullPiece
  include Singleton

  attr_reader :color

  def initialize

  end

  def symbol
    " "
  end
end
