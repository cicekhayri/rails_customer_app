class Train < ActiveRecord::Base
  has_many :customers
  validates :from, presence: true
  validates :destination, presence: true
  validates :date_of_travel, presence: true
end
