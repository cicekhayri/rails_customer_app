class TrainsController < ApplicationController
  def index
    @trains = Train.all
  end

  def new
    @train = Train.new
  end

  def edit
  end

  def show
  end

  def create
  end

  def update
  end

  def delete
  end

end
