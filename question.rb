require_relative('player.rb') 
require_relative('game_logic') 


class Question 
attr_accessor :prompt, :expected_answer, :answer


def initialize 
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @prompt = "#{@current_player} What is #{@num1} + #{@num2}?"
    @expected_answer = @num1 + @num2 
end 

def prompt_question
  puts @prompt
  @answer = gets.chomp.to_i
end

end 