class AddThingsToTrain < ActiveRecord::Migration
  def change
    add_column :trains, :name, :string
  end
end
