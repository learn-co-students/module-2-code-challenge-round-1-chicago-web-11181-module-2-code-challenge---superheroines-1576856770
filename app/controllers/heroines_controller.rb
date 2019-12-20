class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find_by(id: params[:id])
  end

  def create
    @heroine = Heroine.new(heroine_params)
  end

  def new
    Heroine.new(heroine_params)
  end

private

def heroine_params
  params.require(:heroine).permit(:name, :username)
end

end
