class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find_by(id: params[:id])
  end

  def new
    p flash[:errors]
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    heroine = Heroine.new(params.require(:heroine).permit(:name, :super_name, :power_id))
    
    if heroine.save
      redirect_to heroine
    else
      flash[:errors] = heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  def flight
    p = Power.all.find_by(name: 'flight')
    @heroines = Heroine.all.select { |h| h.power == p }
    render :index
  end

  def strong
    p = Power.all.find_by(name: 'super strength' )
    @heroines = Heroine.all.select { |h| h.power == p }
    render :index
  end

  def supersense
    p = Power.all.find_by(name: 'super human senses')
    @heroines = Heroine.select { |h| h.power == p }
    render :index
  end

  def elastic
    p = Power.all.find_by(name: 'elasticity')
    @heroines = Heroine.select { |h| h.power == p }
    render :index
  end
end
