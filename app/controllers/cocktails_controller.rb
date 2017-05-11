class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def create
    @cocktail = Cocktail.new(params[@cocktail])

    if @cocktail.save
      redirect_to cocktails_path
    else
      render :new
    end
  end

end
