class GameController < ApplicationController
  def home
    @tools = Tool.all
  end

  def throw
    player_tool = Tool.find_by(name: params[:tool_name])
    curb_tool = GetCurbsTool.call
    winner = DetermineWinner.call(player_tool:, curb_tool:)

    render json: { curbTool: curb_tool.name, winner: winner }
  end
end

