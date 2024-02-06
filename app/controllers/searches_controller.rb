class SearchesController < ApplicationController
  def index
    @search = Search.new
    @searches = Search.all
  end

  def create_prompt
    @search = Search.new(search_params)
    if @search.save
      redirect_to show_path(@search.id), notice: 'Criado com sucesso.'
    else
      @search = Search.all
      render :index
    end
  end

  def show
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters:
      {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: "me fale sobre a marca #{@search} 2 linhas no maximo"}]
      })
    @content = chaptgpt_response["choices"][0]["message"]["content"]
  end

  private

  def search_params
    params.require(:search).permit(:text)
  end
end
