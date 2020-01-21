class Board
  attr_reader :board, :ALPHA
  require './square'
  ['./knight', './rook','./king','./bishop','./pawn','./queen'].each(&method(:require))
  @@ALPHA = ['A','B','C','D','E','F','G','H']
  def initialize()
    @board = create_board
  end

  def create_board
    new_board = []
    (0..7).each do |i|
      new_board.push([])
      (0..7).each do |j|
        square = Square.new("#{@@ALPHA[j]}#{i}")
        # puts square.coordinate.inspect
        new_board.last.push(square)
      end
    end
    return new_board
  end

  def populate_board
    @board[0][0].piece = Rook.new
    @board[0][1].piece = Knight.new
    @board[0][2].piece = Bishop.new
    @board[0][3].piece = Queen.new
    @board[0][4].piece = King.new
    @board[0][5].piece = Bishop.new
    @board[0][6].piece = Knight.new
    @board[0][7].piece = Rook.new
    @board[1].each do |square|
      square.piece = Pawn.new
    end
    @board[7][0].piece = Rook.new('b')
    @board[7][1].piece = Knight.new('b')
    @board[7][2].piece = Bishop.new('b')
    @board[7][3].piece = Queen.new('b')
    @board[7][4].piece = King.new('b')
    @board[7][5].piece = Bishop.new('b')
    @board[7][6].piece = Knight.new('b')
    @board[7][7].piece = Rook.new('b')
    @board[6].each do |square|
      square.piece = Pawn.new('b')
    end
    
  end
  def make_move(player, inactive_player)
    begin
      orig_square= nil
      dest_square= nil
      puts 'From: '
      start = gets.chomp
      puts 'To: '
      finish = gets.chomp
      Square.all.each do |square|
        orig_square = square if square.coordinate == start.upcase
        dest_square = square if square.coordinate == finish.upcase
      end
      raise "Error: Move doesn't exist" if orig_square == nil || dest_square == nil
      raise "Error: No piece found at #{start}" if orig_square.piece == nil
      raise "Error: Wrong color piece for #{player.name}" if player.color != orig_square.piece.color
      raise "Error: Invalid move for #{orig_square.piece.name}" if !orig_square.piece.valid_move?(orig_square.coordinate, dest_square.coordinate)
      raise "Error: Path blocked" if orig_square.piece.path_blocked?(orig_square.coordinate, dest_square.coordinate, Square.all, player.color)
      raise "Error: Square is occupied" if !dest_square.piece.nil? && orig_square.piece.color == dest_square.piece.color
    rescue Exception=>e
      puts e
      retry
    end
    inactive_player.dead_pieces << dest_square.piece if !dest_square.piece.nil?
    dest_square.piece = orig_square.piece
    orig_square.piece = nil
    if dest_square.piece.name == 'Pawn' && dest_square.piece.promote?(dest_square) == true
      dest_square.piece = dest_square.piece.promote(dest_square, player.dead_pieces) if !player.dead_pieces.empty?
    end
      

  end

  def to_s
    puts '  _______________________________'
    @board.reverse.each_with_index do |row, i|
      puts ' | '+row.join(" | ")+' |'
      puts "#{7-i}|___|___|___|___|___|___|___|___|"
    end
    puts '   A   B   C   D   E   F   G   H'
  end

  

end

