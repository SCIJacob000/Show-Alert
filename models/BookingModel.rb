class Booking < ActiveRecord::Base
	belongs_to :band
	belongs_to :show
end