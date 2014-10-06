class AddUrlToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :link, :string
  end
end
