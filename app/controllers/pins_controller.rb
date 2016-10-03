class PinsController < ApplicationController
  before_action :find_pin, only: [:show, :edit, :update, :destroy]

  #Index action to hold all pins
  def index
    @pins = Pin.all.order('created_at DESC')
  end

  #New action
  def new
    @pin = Pin.new
  end

  #Create action
  def create
    @pin = Pin.new(pin_params)
    if @pin.save
      redirect_to @pin, notice: "Pin saved successfully"
    else
      render 'new'
    end
  end

  #Show action
  def show
  end

  #Edit action
  def edit
  end

  #Update acton
  def update
    if @pin.update_attributes(pin_params)
      redirect_to @pin, notice: "Pin updated successfully"
    else
      render 'edit', alert: "Oops! Something went wrong!"
    end
  end

  #Destroy action
  def destroy
    @pin.destroy
    redirect_to root_path, notice: "Pin deleted successfully"
  end

  private
  def pin_params
    params.require(:pin).permit(:title, :description)
  end

  def find_pin
    @pin = Pin.find(params[:id])
  end
end
