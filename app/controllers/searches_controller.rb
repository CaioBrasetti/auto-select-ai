class SearchesController < ApplicationController
  def index
    @search = Search.new
    @searches = Search.all
  end

  def create_prompt
    @search = Search.new(search_params)
    if @search.save
      redirect_to root_path, notice: 'Criado com sucesso.'
    else
      @search = Search.all
      render :index
    end
  end

  private

  def search_params
    params.require(:search).permit(:text)
  end
end
