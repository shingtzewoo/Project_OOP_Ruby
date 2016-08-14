class Game
  attr_accessor :board, :players
  def initialize
    @board = Board.new
    @players = Player.new
  end
  def start
    no_winner = true
    @board.show
    puts "\nThis is the tictactoe board!\n"
    puts "\nPlayer 1 plays with 'X', and Player 2 plays with 'O'.\n"
    while no_winner
      @board.full
      @players.turn(board.matrix, players.player1)
      @board.full
      @board.show
      @board.full
      @board.win(players.player1)
      @board.full
      @players.turn(board.matrix, players.player2)
      @board.full
      @board.show
      @board.full
      @board.win(players.player2)
      @board.full
    end
  end
end

class Board
  attr_accessor :matrix
  def initialize
    @matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def show
    @matrix.each do |x|
      print "\n#{x}"
    end
  end

  def win(sign)
    if @matrix[0][0].to_s + @matrix[0][1].to_s + @matrix[0][2].to_s == sign*3
      puts "We have a winner! It is player representing class #{sign}"
      exit
    elsif @matrix[1][0].to_s + @matrix[1][1].to_s + @matrix[1][2].to_s == sign*3
      puts "We have a winner! It is player representing class #{sign}"
      exit
    elsif @matrix[2][0].to_s + @matrix[2][1].to_s + @matrix[2][2].to_s == sign*3
      puts "We have a winner! It is player representing class #{sign}"
      exit
    elsif @matrix[0][0].to_s + @matrix[1][0].to_s + @matrix[2][0].to_s == sign*3
      puts "We have a winner! It is player representing class #{sign}"
      exit
    elsif @matrix[0][1].to_s + @matrix[1][1].to_s + @matrix[2][1].to_s == sign*3
      puts "We have a winner! It is player representing class #{sign}"
      exit
    elsif @matrix[0][2].to_s + @matrix[1][2].to_s + @matrix[2][2].to_s == sign*3
      puts "We have a winner! It is player representing class #{sign}"
      exit
    elsif @matrix[0][0].to_s + @matrix[1][1].to_s + @matrix[2][2].to_s == sign*3
      puts "We have a winner! It is player representing class #{sign}"
      exit
    elsif @matrix[0][2].to_s + @matrix[1][1].to_s + @matrix[2][0].to_s == sign*3
      puts "We have a winner! It is player representing class #{sign}"
      exit
    end
  end

  def full
    @matrix.each do |array|
      if array.all? {|position| position == /(X|O)/ } == true
        begin
          puts "No one has won, and the board is full!"
          puts "\n Would you like to start a new game? (Y/N)"
          answer = Kernel.gets.match(/(Y|N)/)
        rescue
          puts "Please enter either Y or N!"
          retry
        else
          if answer == "Y"
            new_matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
            @matrix = new_matrix
          elsif answer == "N"
            puts "\n Exiting game now"
            exit
          end
        end
      end
    end
  end
end

class Player
  attr_accessor :player1, :player2
  def initialize
    @player1 = "X"
    @player2 = "O"
  end

  def turn(array, player)
    begin
      puts "\n Choose a position!"
      position = Kernel.gets.match(/\d+/)[0]
    rescue
      puts "Please choose a valid position! Must be from 1-9"
      retry
    else
      case position
      when "1"
        if array[0][0] == 1
          array[0][0] = player
        else
          puts "Position is taken"
        end
      when "2"
        if array[0][1] == 2
          array[0][1] = player
        else
          puts "Position is taken"
        end
      when "3"
        if array[0][2] == 3
            array[0][2] = player
        else
          puts "Position is taken"
        end
      when "4"
        if array[1][0] == 4
            array[1][0] = player
        else
          puts "Position is taken"
        end
      when "5"
        if array[1][1] == 5
            array[1][1] = player
        else
          puts "Position is taken"
        end
      when "6"
        if array[1][2] == 6
            array[1][2] = player
        else
          puts "Position is taken"
        end
      when "7"
        if array[2][0] == 7
            array[2][0] = player
        else
          puts "Position is taken"
        end
      when "8"
        if array[2][1] == 8
            array[2][1] = player
        else
          puts "Position is taken"
        end
      when "9"
        if array[2][2] == 9
            array[2][2] = player
        else
          puts "Position is taken"
        end
      end
    end
  end
end