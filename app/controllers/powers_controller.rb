class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

  def show
    @power = find_item
  end

  private
    def find_item
      Power.find_by(id: params[:id])
    end

    def allowed_params
      params.require(power).permit(:name, :description)
    end

end
