class Game
  attr_accessor :board, :AI, :player
  def initialize player_name
    @board = Board.new
    @AI = Computer.new("Jarvis")
    @player = Player.new(player_name)
  end

  guesses = 12

  def start
    while guesses > 0
    end
  end

end

class Board
  attr_accessor :matrix, :feedback, :platform
  def initialize
    @matrix = [[1, 2, 3, 4]
               [1, 2, 3, 4]
               [1, 2, 3, 4]
               [1, 2, 3, 4]
               [1, 2, 3, 4]
               [1, 2, 3, 4]
               [1, 2, 3, 4]
               [1, 2, 3, 4]
               [1, 2, 3, 4]
               [1, 2, 3, 4]
               [1, 2, 3, 4]
               [1, 2, 3, 4]]
    @feedback = [1, 2, 3, 4]
  end

  feedback_colors = ["white", "black"]
  colors = ["red", "blue", "yellow", "green", "purple", "orange"]

  def display
    @matrix.each do |row|
      print "\n#{row}"
    end
  end

  def hint
  end

end

class Computer
  attr_accessor :name
  def initialize name
    @name = name
    @code = []
  end

  def generator array
    color1 = array.sample(1)
    color2 = array.sample(1)
    color3 = array.sample(1)
    color4 = array.sample(1)
    @code << color1 << color2 << color3 << color4
  end
end

class Player
  attr_accessor :name
  def initialize name
    @name = name
  end
end