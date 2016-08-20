class Game
  attr_accessor :board, :AI, :player, :guesses
  def initialize player_name
    @board = Board.new
    @AI = Computer.new("Jarvis")
    @player = Human.new(player_name)
    @guesses = 12
    @answer = " "
    @AI.generator(@board.colors)
  end

  def case_tries
    @answer = gets.chomp
    case @answer
    when "codebreaker"
      while guesses > 0
        @player.guess(@AI.computercode, "You")
        @guesses-=1
        @AI.hint(@AI.computercode, @player.guess_array, @board.feedback, @board.feedback_colors)
        puts "\nNo. of turns left: #{@guesses}"
        if @guesses == 0
          puts "\n You lost! You didn't manage to guess within 12 tries."
          puts "\n The color code was #{@AI.computercode.join('-')}"
        end
      end
    when "codemaker"
      @player.generate_code
      while guesses > 0
        @AI.generator(@board.colors)
        @AI.ai_guess(@player.humancode)
        @guesses-=1
        @player.hint(@player.humancode, @AI.computercode, @board.feedback, @board.feedback_colors)
        puts "\nNo. of turns left: #{@guesses}"
        if @guesses == 0
          puts "\n AI has lost! It didn't manage to guess within 12 tries."
          puts "\n The color code was #{@player.humancode.join('-')}"
        end
      end
    end
  end

#the start method is for the player to initiate the game
  def start
    puts "Do you want to be the codebreaker or codemaker?"
    case_tries
    until (@answer == "codemaker" || @answer == "codebreaker")
      puts "Please put a valid answer! Either codemaker or codebreaker!"
      case_tries
    end
  end

end

class Board
  attr_accessor :matrix, :feedback, :colors, :feedback_colors
  def initialize
    @matrix = [" ", " ", " ", " "]
    @feedback = [" ", " ", " ", " "]
    @colors = ["red", "blue", "yellow", "green", "purple", "orange"]
    @feedback_colors = ["white", "black"]
  end

end

class Player
  attr_accessor :guess_array, :index_array
  def guess(array, player)
    @guess_array = [" ", " ", " ", " "]
    puts "Colors: red, blue, yellow, green, purple, orange."
    puts "\n1st slot guess"
    slot_1 = gets.chomp
    puts "\n2nd slot guess"
    slot_2 = gets.chomp
    puts "\n3rd slot guess"
    slot_3 = gets.chomp
    puts "\n4th slot guess"
    slot_4 = gets.chomp
    @guess_array[0] = slot_1.downcase
    @guess_array[1] = slot_2.downcase
    @guess_array[2] = slot_3.downcase
    @guess_array[3] = slot_4.downcase
    if @guess_array == array
      puts "#{player} have won, you managed to guess the code!"
      exit
    else
      puts "\nWrong guess!"
    end
  end

  def hint(code, guesses, feedback, color)
    @index_array = []
    #index array is used to collect the indexes of duplicate colours in guesses
    #because duplicate colours cannot all be awarded a key peg unless they correspond to the same number of duplicate colours in the hidden code
    #the largest index in this array will be used as an index for the feedback array to change its value to "____" instead
    i = 0
    while i < code.length
      if code[i] == guesses[i]
        feedback[i] = color[1]
      elsif code[i] != guesses[i] && code.include?(guesses[i])
        feedback[i] = color[0]
        if guesses.count(guesses[i]) > code.count(guesses[i])
          guesses.each_with_index do |obj, index|
            if obj == guesses[i]
              @index_array.push(index)
            end
          end
          feedback[@index_array.max] = "____"
        end
      elsif code[i] != guesses[i]
        feedback[i] = "____"
      end
      i+=1
    end
    print "The hints are: #{feedback.join("|")}"
    @index_array.clear
  end
end

class Computer < Player
  attr_accessor :name, :computercode
  def initialize name
    @name = name
    @computercode = [" ", " ", " ", " "]
  end

  def generator array
    colour1 = array.sample(1).join("")
    colour2 = array.sample(1).join("")
    colour3 = array.sample(1).join("")
    colour4 = array.sample(1).join("")
    @computercode[0] = colour1
    @computercode[1] = colour2
    @computercode[2] = colour3
    @computercode[3] = colour4
  end

  def ai_guess array
    if @computercode == array
      puts "AI has won, it managed to guess the code!"
      exit
    else
      puts "\nWrong guess!"
    end
  end
end

class Human < Player
  attr_accessor :name, :humancode
  def initialize name
    @name = name
    @humancode = []
  end

  def generate_code
    puts "Colors you can choose: red, blue, yellow, green, purple, orange."
    puts "\nChoose your first colour"
    colour1 = gets.chomp
    puts "\nChoose your second colour"
    colour2 = gets.chomp
    puts "\nChoose your third colour"
    colour3 = gets.chomp
    puts "\nChoose your fourth colour"
    colour4 = gets.chomp
    @humancode << colour1 << colour2 << colour3 << colour4
  end
end