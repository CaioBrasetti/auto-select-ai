class Search < ApplicationRecord
  def content(body1, transmission2, engine3, traction4, optionals5)
    Rails.cache.fetch("#{cache_key_with_version}/content") do # verificar essa linha
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "Me de 5 opções de carros que se enquadram o mais proximo possivel dessas caracteristicas:
        carroceria #{body1},
        trasmissao #{transmission2}
        motorização #{engine3}
        Tração #{traction4}
        com os opcionais#{optionals5}." }]
      })
    return chaptgpt_response["choices"][0]["message"]["content"]
    end
  end
end
