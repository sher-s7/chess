class Pawn
  require './piece'
  include Piece
  attr_accessor :moves, :unicode, :color, :name

  def initialize(color='w')
    @name = 'Pawn'
    @color = color
    @color == 'w' ? @unicode = "P".light_white : @unicode = "P".light_green
    @color=='w' ? @moves = [[0,1]] : @moves = [[0,-1]]
  end

  def path_blocked?(start,finish,squares, color)
    squares.each do |square|
      if square.coordinate == finish
        return true if !square.piece.nil? && square.piece.color == color
      end
    end
    return false
  end

  def promote?(square)
    if (square.piece.color == 'w' && square.coordinate[1] == '7') || (square.piece.color == 'b' && square.coordinate[1] == '0')
      return true
    end
    return false
  end

  def promote(square, pieces)
    puts 'Do you want to promote your Pawn? (y/n)'
    begin
      answer = gets.chomp
      if !(answer.downcase == 'y' || answer.downcase == 'n')
        raise 'Error: Enter "y" (yes) or "n" (no)'
      end
    rescue Exception=>e 
      puts e
      retry
    end

    if answer == 'n'
      return square.piece
    elsif answer == 'y'
      puts "Available pieces: "
      pieces.each_with_index do |piece, i|
        puts "#{i}: #{piece.name}"
      end
    end
    begin
      puts "Enter the number piece you want to use"
      num = gets.chomp
      raise 'Error: Enter valid number' if num.to_i.to_s != num
      raise 'Error: Number out of range' if pieces[num.to_i].nil?
    rescue Exception=>e 
      puts e
      retry
    end
    num = num.to_i
    piece = pieces[num]
    pieces.delete_at(num)
    return piece
  end




  

end