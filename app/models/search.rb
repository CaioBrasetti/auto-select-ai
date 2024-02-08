class Search < ApplicationRecord
  def content(text)
    Rails.cache.fetch("#{cache_key_with_version}/content") do # verificar essa linha
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "Me fale um carro de cada marca, sendo elas: #{text}."}]
    })
    return chaptgpt_response["choices"][0]["message"]["content"]
    end
  end
end
