class Entry < ActiveRecord::Base
  validates :title, :location, :time, :date, :host, presence: true
  
  belongs_to :user
end
