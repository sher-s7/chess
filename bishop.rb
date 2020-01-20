class Bishop
  require './piece'
  include Piece
  attr_accessor :moves, :unicode, :color, :name

  def initialize(color='w')
    @name = 'Bishop'
    @color = color
    @color == 'w' ? @unicode = @unicode = "B".light_white : @unicode = "B".light_green
    @moves = [*-7..7].map {|n| [n,n]} + [*-7..7].map {|n| [n,-n]}
  end

  def get_path(start, finish)
    y1 = start[1].to_i
    y2 = finish[1].to_i
    path = []
    if start[0] > finish[0] && y1 > y2
      (finish[0]...start[0]).drop(1).each do |letter|
        path.push(letter)
      end
      (y2...y1).drop(1).each_with_index do |n, i|
        path[i] += "#{n}"
      end
    elsif start[0] > finish[0] && y1 < y2
      (finish[0]...start[0]).drop(1).each do |letter|
        path.push(letter)
      end
      arr = (y2-1).downto(y1+1).to_a
      arr.each_with_index do |n, i|
        path[i] += "#{n}"
      end
    elsif start[0] < finish[0] && y1 < y2
      (start[0]...finish[0]).drop(1).each do |letter|
        path.push(letter)
      end
      (y1...y2).drop(1).each_with_index do |n, i|
        path[i] += "#{n}"
      end
    elsif start[0] < finish[0] && y1 > y2
      (start[0]...finish[0]).drop(1).each do |letter|
        path.push(letter)
      end
      arr = (y1-1).downto(y2+1).to_a
      arr.each_with_index do |n, i|
        path[i] += "#{n}"
      end
    end
    return path
  end

  def path_blocked?(start, finish, squares, color)
    path = get_path(start, finish)
    squares.each do |square|
      if path.include?(square.coordinate)
        return true if !square.piece.nil?
      end
    end
    return false
  end
end