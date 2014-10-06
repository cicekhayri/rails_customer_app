class AddDateDestinationAndFromToTrain < ActiveRecord::Migration
  def change
    add_column :trains, :destination, :string
    add_column :trains, :date_of_travel, :date
    add_column :trains, :from, :string
    
    add_reference :trains, :customer, index: true
  end
end
