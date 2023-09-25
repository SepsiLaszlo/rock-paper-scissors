class DetermineWinner
  private attr_reader :curb_tool, :player_tool

  def self.call(args)
    new(**args).call
  end

  def initialize(player_tool:, curb_tool:)
    @curb_tool = curb_tool
    @player_tool = player_tool
  end

  def call
    if player_tool.beats?(curb_tool)
      'player'
    elsif curb_tool.beats?(player_tool)
      'curb'
    else
      'tie'
    end
  end
end