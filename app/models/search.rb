class Search < ApplicationRecord
  def content(optionals5)
    Rails.cache.fetch("#{cache_key_with_version}/content") do # verificar essa linha
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "Me mostre um carro que seja #{optionals5}, e que possua cambio #{optionals5}." }]
      })
    return chaptgpt_response["choices"][0]["message"]["content"]
    end
  end
end
