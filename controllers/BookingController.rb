class BookingController < ApplicationController
	post '/' do 
		show = Show.find params[:id]
		existing_booking = Booking.find_by show_id: params[:id]
		#build it
		booking = Booking.new
		#set values
		booking.venue = existing_booking.venue
		booking.band_id = session[:id]
		booking.show_id = params[:id] #add line in login that adds the band id to the session obj
		#booking.show_id = params
		#we need to get the show_id based on the show they click in the dropdown
		booking.save
		puts booking
		session[:message]={
			success: true,
			message: "You have been booked! Break a leg!"
		}
	end
end