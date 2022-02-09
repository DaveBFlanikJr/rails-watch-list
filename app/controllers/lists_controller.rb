class ListsController < ApplicationController
  before_action :list, only: [:show, :destroy]
  def index
    @lists = List.all
  end

  # display
  def show
  end

  # create a new entry
  def new
    @list = List.new
  end

  # Create a new list
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  # destroy
  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private
  # def a list
  def list
    @list = List.find(params[:id])
  end

  # def list params
  def list_params
    params.require(:list).permit(:name)
  end
end
