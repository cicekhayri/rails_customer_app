class FixFromName < ActiveRecord::Migration
  def change
    rename_column :trains, :from, :travel_from
  end
end
