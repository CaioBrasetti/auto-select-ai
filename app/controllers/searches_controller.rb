class SearchesController < ApplicationController
  def index
    @search = Search.new
    @searches = Search.all
  end

  def create_prompt
    converted_variable_in_string = search_params[:optionals5].join(', ')
    @search = Search.new(optionals5: converted_variable_in_string)
    if @search.save
      redirect_to show_path(@search.id), notice: 'Criado com sucesso.'
    else
      @searchs = Search.all
      render :index
    end
  end

  def show
    search = Search.find(params[:id])
    @content = Search.new.content(search.optionals5)
  end

  private

  def search_params
    params.require(:search).permit(:body1, :transmission2, :engine3, :traction4, :optionals5 => [])
  end
end
