class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])

    if @dose.save
      redirect_to cocktails_path(@cocktail)
    else
      render :new
    end
  end

  def delete
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.destroy!
    redirect_to '/dose/new', :notice => "Your dose has been deleted"
  end

private

  def dose_params
    params.require(:dose).permit(:description)
  end

end
