class Potluck < ActiveRecord::Base
  validates :name, :location, :datetime, presence: true

  belongs_to :user
end
