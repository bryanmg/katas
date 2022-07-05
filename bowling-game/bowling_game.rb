# frozen_string_literal: true
# https://kata-log.rocks/bowling-game-kata

class Game
  def initialize
    @turn = 0
    @turn_controll = 9
    @game = 10.times.map{[nil,nil]}
  end

  def roll(points)
    raise "Limit rolls exceded" if @turn > @turn_controll
    raise "Points score invalid, 0-10 allowed" if points > 10 || points < 0

    if @game[@turn][0].nil?
      if points == 10
        is_strike
        is_it_ten_roll if @turn == 9
      else
        @game[@turn][0] = points
      end
      puts "#{10-@turn} turns remaning, second set"
      return
    end

    if @game[@turn][1].nil?
      @game[@turn][1] = points
      @turn += 1
    end
    
    puts "#{10-@turn} turns remaning"
  end

  def score
    @game.each_with_index.map do |roll, idx|
      if roll[0] == 10 && idx < 8
        roll << [@game[idx+1][0], @game[idx+2][0]]
        next
      end
      
      if roll.sum == 10 && idx < 9
        roll << @game[idx+1][0]
        next
      end
    end
    @game[@turn-2] << 10 if @game[@turn-1] == 10

    @game.flatten.compact.sum
  end

  private
  attr_reader :turn, :game

  def is_strike
    @game[@turn][0] = 10
    @game[@turn][1] = 0
    @turn += 1
  end

  def is_it_ten_roll
    puts "congrats! you win another roll"
    @game << [nil]
    @turn_controll += 1
  end
  
  def bonifications
    if @game[@turn-1].compact.sum == 10 && @game[@turn-1][0] != 10
      @game[@turn-1] << @game[@turn][0]
    end
    if @game[@turn-2][0] == 10
      @game[@turn-2] << (@game[@turn-1][0] + @game[@turn][0]) 
    end
  end
end

# binding.irb