class Train < ActiveRecord::Base
  has_many :customers
  validates :travel_from, presence: true
  validates :destination, presence: true
  validates :date_of_travel, presence: true

  def self.search(search)
    if search
      where(['travel_from LIKE ? OR destination LIKE ?', "%#{search}%","%#{search}%"])
    else
      all	
    end
  end
end
