class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def new
    @heroine = Heroine.new
    house_keeping
  end

  def create
    @heroine = Heroine.create(allowed_params)
    if @heroine.valid?
      redirect_to("/heroines/#{@heroine.id}")
    else
      house_keeping
      render("new")
    end
  end

  def show
    @heroine = find_item
  end

  private
    def find_item
      Heroine.find_by(id: params[:id])
    end

    def allowed_params
      params.require(:heroine).permit(:name, :super_name, :power_id)
    end
    
    def house_keeping
      @powers = Power.all
    end

end
