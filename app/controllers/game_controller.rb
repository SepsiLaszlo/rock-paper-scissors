class GameController < ApplicationController
  def home
    @tools = Tool.all
  end

  def throw
    player_tool = Tool.find(params[:tool_id])
    opponent_tool = Tool.order("RANDOM()").limit(1)

    if player_tool.beats?(opponent_tool)
      @result = 'Player won'
    elsif opponent_tool.beats?(player_tool)
      @result = 'Opponent won'
    else
      @result = 'Tie'
    end
  end
end

