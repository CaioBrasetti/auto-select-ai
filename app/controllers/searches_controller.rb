class SearchesController < ApplicationController
  def index
    @search = Search.new
    @searches = Search.all
  end

  def create_prompt
    body1_value = search_params[:body1].presence || ""
    transmission2_value = search_params[:transmission2].presence || ""
    engine3_value = search_params[:engine3].presence || ""
    traction4_value = search_params[:traction4].presence || ""
    optionals5_converted_variable_in_string = search_params[:optionals5].present? ? search_params[:optionals5].join(', ') : ""

    @search = Search.new(
      body1: body1_value,
      transmission2: transmission2_value,
      engine3: engine3_value,
      traction4: traction4_value,
      optionals5: optionals5_converted_variable_in_string
    )

    if @search.save
      redirect_to show_path(@search.id), notice: 'Criado com sucesso.'
    else
      @searchs = Search.all
      render :index
    end
  end

  def show
    search = Search.find(params[:id])
    @content = Search.new.content(
      search.body1,
      search.transmission2,
      search.engine3,
      search.traction4,
      search.optionals5
    )
  end

  private

  def search_params
    params.require(:search).permit(:body1, :transmission2, :engine3, :traction4, :optionals5 => [])
  end
end
