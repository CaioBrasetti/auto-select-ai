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
    search = Search.find(params[:id])
    @content = Search.new.content(search.text)
  end

  private

  def search_params
    params.require(:search).permit(:text)
  end
end
