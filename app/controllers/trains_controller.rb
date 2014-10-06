class TrainsController < ApplicationController
  before_filter :find_train, only: [:edit, :show, :destroy]

  def index
    @trains = Train.order(params[:sorted])
  end

  def new
    @train = Train.new
  end

  def edit
  end

  def show
  end

  def from
    @train = Train.where(from: params[:origin])
  end

  def to
    @train = Train.where(destination: params[:origin])
  end

  def create
    @train = Train.new(train_params)

    if @train.save
      redirect_to trains_path
    else
      render 'new'
    end
  end

  def update
    @train = find_train

    if @train.update_attributes(train_params)
      redirect_to trains_path
    else
      render 'edit'
    end
  end

  def destroy
    @train.destroy
    redirect_to trains_path
  end

  private
  def train_params
    params.require(:train).permit(:from, :date_of_travel, :destination)
  end

  def find_train
    @train = Train.find(params[:id])
  end

end
