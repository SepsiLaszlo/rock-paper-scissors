class GetCurbsTool
  def self.call
    response = Faraday.get('https://5eddt4q9dk.execute-api.us-east-1.amazonaws.com/rps-stage/throw', request: { timeout: 5 })
    tool_name = response.body['body']
    return random_tool if tool_name.blank?
    tool = Tool.find_by(name: tool_name)

    return random_tool if tool.blank?
    tool
  rescue
    random_tool
  end

  private

  def self.random_tool
    Tool.order("RANDOM()").limit(1).first
  end
end