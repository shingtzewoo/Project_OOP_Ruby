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
      @players.turn(board.matrix, players.player1)
      @board.show
      @board.win(self.players.player1)
      @players.turn(board.matrix, players.player2)
      @board.show
      @board.win(self.players.player2)
    end
  end

  private

  def finish
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
    winning_condition_1 = (@matrix[0][0].to_s + @matrix[0][1].to_s + @matrix[0][2].to_s == sign*3)
    winning_condition_2 = (@matrix[1][0].to_s + @matrix[1][1].to_s + @matrix[1][2].to_s == sign*3)
    winning_condition_3 = (@matrix[2][0].to_s + @matrix[2][1].to_s + @matrix[2][2].to_s == sign*3)
    winning_condition_4 = (@matrix[0][0].to_s + @matrix[1][0].to_s + @matrix[2][0].to_s == sign*3)
    winning_condition_5 = (@matrix[0][1].to_s + @matrix[1][1].to_s + @matrix[2][1].to_s == sign*3)
    winning_condition_6 = (@matrix[0][2].to_s + @matrix[1][2].to_s + @matrix[2][2].to_s == sign*3)
    winning_condition_7 = (@matrix[0][0].to_s + @matrix[1][1].to_s + @matrix[2][2].to_s == sign*3)
    winning_condition_8 = (@matrix[0][2].to_s + @matrix[1][1].to_s + @matrix[2][0].to_s == sign*3)
    winning_array = [winning_condition_1.to_s, winning_condition_2.to_s, winning_condition_3.to_s,
                      winning_condition_4.to_s, winning_condition_5.to_s, winning_condition_6.to_s,
                      winning_condition_7.to_s, winning_condition_8.to_s]
    winning_array.each do |combination|
      if @matrix.include?(combination)
        puts "We have a winner! It is player representing class #{sign}"
        exit
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