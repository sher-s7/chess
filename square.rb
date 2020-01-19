class Square
  attr_reader :coordinate
  attr_accessor :piece

  @@instances = []
  def initialize(coordinate)
    @coordinate = coordinate
    @piece = nil
    @@instances << self
  end

  def self.all
    return @@instances
  end

  def to_s
    return piece.nil? ? ' ' : piece.unicode
  end
end