class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @ingredient = Ingredient.all.map { |ingredient| ingredient.name }
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.find(params[:dose][:ingredient_id])
    @dose = Dose.create( description: dose_params[:description], cocktail_id: @cocktail, ingredient_id: @ingredient)
    @dose.cocktail = @cocktail
    @dose.ingredient_id = @ingredient.id
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id)
  end

end
