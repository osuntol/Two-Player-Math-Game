class Player
attr_accessor :player_name, :player_total_lives

   def initialize(name, total_lives)
      @player_name = name
      @player_total_lives = total_lives
   end
end

