class TrainsController < ApplicationController
  before_filter :find_train, only: [:edit, :show, :destroy]

  def index
    @trains = Train.search(params[:search]) 
    @trains.destroy_all(['created_at < ?', 1.hour.ago])
  end

  def new
    @train = Train.new
  end

  def edit
  end

  def show
  end

  def from
    @train = Train.where(['travel_from LIKE ? OR destination LIKE ?', "%#{params[:origin]}%","%#{params[:origin]}%"])
  end

  def to
    from
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
    params.require(:train).permit(:travel_from, :date_of_travel, :destination)
  end

  def find_train
    @train = Train.find(params[:id])
  end

end
