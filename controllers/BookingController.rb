class BookingController < ApplicationController

	post "/:id" do 
		band_to_add = Band.find_by name: params[:name]
		show = Show.find params[:id]
		existing_booking = Booking.find_by show_id: params[:id]
		if ((existing_booking.band_id == session[:band_id]) && (session[:logged_in] == true) && band_to_add)
			#build it
			booking = Booking.new
			#set values
			booking.venue = existing_booking.venue
			booking.band_id = band_to_add.id
			booking.show_id = params[:id] #add line in login that adds the band id to the session obj
			#booking.show_id = params
			#we need to get the show_id based on the show they click in the dropdown
			booking.save
			puts booking
			session[:message]={
				success: true,
				message: "You have been booked! Break a leg!"
		}
		redirect "/bands/#{session[:band_id]}"
		else
			session[:message]={
				success: true,
				message: "Get lost dude!"
			}
			redirect '/bands'
		end
	end
end