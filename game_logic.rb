require_relative ('player')
require_relative( 'question')

class Game_logic
  attr_accessor :player1, :player2, :current_player, :turn 
  def initialize
    @player1 = Player.new('John', 3)
    @player2 = Player.new('Randy', 3)
    @current_player = ''
    @turn = 0
  end

  def whos_playing
    @turn += 1
    if @turn.even?
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def answer_check
    @question = Question.new
    @question.prompt_question
    if @question.answer == @question.expected_answer
      puts "Player #{@current_player.player_name} is correct!"
      
    else
      puts "#{@current_player.player_name} you are Incorrect!"
      @current_player.player_total_lives -= 1
      puts "#{@player1.player_name} #{@player1.player_total_lives}/3 vs #{@player2.player_name} #{@player2.player_total_lives}/3"
      puts "--- new turn ---"
    end
  end

  def play
    while @player1.player_total_lives > 0 && @player2.player_total_lives > 0
      whos_playing
      answer_check
    end 
    if @player1.player_total_lives == 0
      puts "Game over #{@player1.player_name}! Player #{@player2.player_name} wins!"
    elsif @player2.player_total_lives == 0 
      puts "Game over #{@player2.player_name}! Player #{@player1.player_name} wins!"
    end
  end
end