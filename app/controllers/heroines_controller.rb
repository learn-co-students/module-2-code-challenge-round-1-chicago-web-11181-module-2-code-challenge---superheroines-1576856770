class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  # def index_search_by_superpower
  #   @heroines = Heroine.all
  #   binding.pry
  # end
  # lines 6-10 commented out, ran out of time
  # this was the controller action to route to my index page
  # for a specific superpower (see index_search_by_superpower view)

  def show
    @heroine = Heroine.find_by(id: params[:id])
  end

  def new
    @errors = flash[:errors]
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    heroine = Heroine.new(heroine_params)

    if heroine.valid?
      heroine.save
      redirect_to heroine_path(heroine)
    else
      flash[:errors] = heroine.errors.full_messages
      redirect_to new_heroine_path(heroine)
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

end
