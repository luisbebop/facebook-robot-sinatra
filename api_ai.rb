require 'api-ai-ruby'

module ApiAi
  # init API.ai
  @ai_client = ApiAiRuby::Client.new(
    :client_access_token => ENV["APIAI_ACCESS_TOKEN"],
    :subscription_key => ENV["APIAI_SUBSCRIPTION_KEY"]
  )
  
  def self.chat(message)
    response = @ai_client.text_request(message)
        
    if response[:result][:speech] == ""
      if response[:result][:metadata][:html].nil?
        "I don't have an answer for that. Could you rephrase it?"
      end
    else
      response[:result][:speech]
    end
  end
end