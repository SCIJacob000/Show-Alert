class Show < ActiveRecord::Base
	has_many :bookings
	has_many :bands, :through => :bookings
end