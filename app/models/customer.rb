class Customer < ActiveRecord::Base
  belongs_to :train
  validates :name, presence: true
  validates :link, presence: true
end
