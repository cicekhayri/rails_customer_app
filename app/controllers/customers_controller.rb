class CustomersController < ApplicationController

  before_filter :find_customer, only: [:edit, :show, :destroy]

  def index
    @customers = Customer.order(params[:sorting])
  end

  def new
    @customer = Customer.new
  end

  def edit
  end

  def show
  end 

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to customers_path
    else
      render 'new'
    end
  end

  def update
    @customer = find_customer

    if @customer.update_attributes(customer_params)
      redirect_to customers_path
    else
      render 'edit'
    end
  end

  def destroy
    @customer.destroy
    
    redirect_to customers_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :link, :train_id)
  end

  def find_customer
    @customer = Customer.find(params[:id])
  end
end
