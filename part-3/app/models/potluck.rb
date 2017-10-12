class Potluck < ActiveRecord::Base
  validates :name, :location, :date_at, :time_at, presence: true

  belongs_to :user
end
