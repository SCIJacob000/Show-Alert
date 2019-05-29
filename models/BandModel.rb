class Band < ActiveRecord::Base
	has_many :bookings
	has_many :shows, :through => :bookings
	has_secure_password
end