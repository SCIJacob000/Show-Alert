class BookingController < ApplicationController
	get '/new' do
		band = Band.find params[:id]
		show = Show.find params [:id]
		if band && !show 
			shows = band.shows
			erb :booking_new
		else 
			erb :booking_new
		end
	end

	post '/bookings' do 
		#build it
		booking = Booking.new
		#set values
		booking.venue = params[venue]
		booking.band_id = session[:id] #add line in login that adds the band id to the session obj
		#booking.show_id = params
		#we need to get the show_id based on the show they click in the dropdown
		booking.save
		session[:message]={
			success: true,
			message: "You have been booked! Break a leg!"
		}
	end
end