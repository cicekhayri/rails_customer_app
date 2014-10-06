class AddTrainIdToCustomer < ActiveRecord::Migration
  def change
    add_reference :customers, :train, index: true
  end
end
