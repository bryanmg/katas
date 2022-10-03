# frozen_string_literal: true

class TennisGame1
  GAMESCORES = { 0 => 'Love', 1 => 'Fifteen', 2 => 'Thirty', 3 => 'Forty' }.freeze

  def initialize(player1Name, player2Name)
    @player1Name = player1Name
    @player2Name = player2Name
    @p1points = 0
    @p2points = 0
  end

  def won_point(playerName)
    @p1points += 1 if playerName == player1Name
    @p2points += 1 if playerName == player2Name
  end

  def score
    if p1points == p2points
      score_insificent(p1points)
    elsif p1points >= 4 || p2points >= 4
      winned_game(p1points - p2points)
    else
      "#{compound_score(p1points)}-#{compound_score(p2points)}"
    end
  end

  private

  attr_reader :player1Name, :player2Name, :p1points, :p2points

  def winned_game(points)
    if points == 1
      'Advantage player1'
    elsif points == -1
      'Advantage player2'
    elsif points >= 2
      'Win for player1'
    else
      'Win for player2'
    end
  end

  def score_insificent(points)
    result = GAMESCORES.except(3)[points]

    return 'Deuce' if result.nil?

    "#{result}-All"
  end

  def compound_score(score)
    GAMESCORES[score]
  end
end

class TennisGame2
  GAMESCORES = { 1 => 'Fifteen', 2 => 'Thirty', 3 => 'Forty' }.freeze

  def initialize(player1Name, player2Name)
    @player1Name = player1Name
    @player2Name = player2Name
    @p1points = 0
    @p2points = 0
  end

  def won_point(player)
    @p1points += 1 if player == player1Name
    @p2points += 1 if player == player2Name
  end

  def score
    result = ''
    if (p1points == p2points) && (p1points < 3)
      result = 'Love' if p1points.zero?
      result = 'Fifteen' if p1points == 1
      result = 'Thirty' if p1points == 2

      return "#{result}-All"
    else
      result = 'Deuce'
    end

    p1res = ''
    p2res = ''

    if p1points.positive? && p2points.zero?
      p1res = GAMESCORES[p1points]
      p2res = 'Love'

      result = "#{p1res}-Love"
    end

    if p1points.zero? && p2points.positive?
      p2res = GAMESCORES[p2points]

      p1res = 'Love'
      result = "Love-#{p2res}"
    end

    if win_player_1? && (p1points < 4)
      p1res = 'Thirty' if p1points == 2
      p1res = 'Forty' if p1points == 3
      p2res = 'Fifteen' if p2points == 1
      p2res = 'Thirty' if p2points == 2
      result = "#{p1res}-#{p2res}"
    end

    if win_player_2? && (p2points < 4)
      p2res = 'Thirty' if p2points == 2
      p2res = 'Forty' if p2points == 3
      p1res = 'Fifteen' if p1points == 1
      p1res = 'Thirty' if p1points == 2
      result = "#{p1res}-#{p2res}"
    end

    result = "Advantage #{@player1Name}" if win_player_1? && (p2points >= 3)
    result = "Advantage #{@player2Name}" if win_player_2? && (p1points >= 3)
    result = "Win for #{@player1Name}" if (p1points >= 4) && (p2points >= 0) && ((p1points - p2points) >= 2)
    result = "Win for #{@player2Name}" if (p2points >= 4) && (p1points >= 0) && ((p2points - p1points) >= 2)
    result
  end

  private

  attr_reader :player1Name, :player2Name, :p1points, :p2points

  def win_player_1?
    @p1points > @p2points
  end

  def win_player_2?
    @p2points > @p1points
  end
end

# class TennisGame3
#   def initialize(player1Name, player2Name)
#     @p1N = player1Name
#     @p2N = player2Name
#     @p1 = 0
#     @p2 = 0
#   end

#   def won_point(n)
#     if n == @p1N
#         @p1 += 1
#     else
#         @p2 += 1
#     end
#   end

#   def score
#     if (@p1 < 4 and @p2 < 4) and (@p1 + @p2 < 6)
#       p = ["Love", "Fifteen", "Thirty", "Forty"]
#       s = p[@p1]
#       @p1 == @p2 ? s + "-All" : s + "-" + p[@p2]
#     else
#       if (@p1 == @p2)
#         "Deuce"
#       else
#         s = @p1 > @p2 ? @p1N : @p2N
#         (@p1-@p2)*(@p1-@p2) == 1 ? "Advantage " + s : "Win for " + s
#       end
#     end
#   end
# end
