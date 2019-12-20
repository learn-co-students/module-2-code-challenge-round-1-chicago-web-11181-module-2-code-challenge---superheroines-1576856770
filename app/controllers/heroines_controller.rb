class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    @heroine = Heroine.new(heroine_params(:name, :super_name, :power_id))
    if @heroine.save
      redirect_to @heroine
    else
      flash[:errors] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  def show
    @heroine = Heroine.find_by(id: params[:id])
  end


  private

  def heroine_params(*args)
    params.require(:heroine).permit(*args)
  end

end
