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
      redirect_to heroine_path(@heroine)
    else
      render :new
    end
  end

  private

  def hero_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end

# "name"=>"Mrs. F", "super_name"=>"Missus Frankee", "power_id"=>"3"