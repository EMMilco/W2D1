class NullPiece
  include Singleton

  def initialize

  end
  def symbol
    @color == :white ? " " : " "
  end
end
