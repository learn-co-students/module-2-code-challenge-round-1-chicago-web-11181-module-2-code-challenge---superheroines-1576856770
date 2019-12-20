class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find_by(id: params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(hero_params)
      if @heroine.valid?
        @heroine.save
        redirect_to heroines_path(@heroine)
      else
        redirect_to new_heroine_path
      end
  end

  private

  def hero_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
