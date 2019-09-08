## ALL other controllers in your app will inherit from Application Controller

class ShowController < ApplicationController
  
    # this is a 'before' filter, it will be run 
    # for all routes before the request is processed
    # you can customize it to only run on certain routes or
    # under certain circumstances
  
    before do
      puts "before filter is running"
  
      if !session[:logged_in]
        # message
        session[:message] = {
          success: false,
          status: "neutral",
          message: "You must be logged in to do that."
        }
        #redirect
        redirect '/users/login'
  
      end
  
    end
  

    # index
    get '/' do
      # get all shows from db
      @shows = Show.all
      # show = Show.find_by({ :show_id => params[:id] })
      # @shows = booking.show_id # just logged in booking's shows
  
      erb :show_index
    end
  
   
    # edit
     get '/:id/edit' do
    #   # get show from db in an instance var
       @show = Show.find params[:id]
    #   # render a form with show data
      erb :show_edit
    end
  
    # create
    post '/' do
      # create new show
      new_show = Show.new
      # set fields
      new_show.date_time = params[:date_time]
      new_show.tickets = params[:tickets]
      new_show.save 

      # figure out who's logged in and create a booking that associates this new show with that band!
      logged_in_band = Band.find_by name: session[:username]
      
      puts "here is the logged in band: " 
      puts logged_in_band

      new_booking = Booking.new
      new_booking.venue = params[:venue]
      new_booking.band_id = logged_in_band.id
      new_booking.show_id = new_show.id
      new_booking.save
      puts new_booking

      session[:message]={
        success: true,
        message: "Successfully created show at #{new_booking.venue}"
      }
      redirect '/shows'
    end
  
     # new -- 
    get '/new' do
    # just render template that has form      # just render template that has form
    puts "here is the session"
    puts session
      erb :new_show
    end
  
    # show -- 
      # get show from db in a var
      # render show page with it
      
    # update 
    put '/:id' do
    #   # find it
       show = Show.find params[:id]
      
    #   # in the API -- be sure to check that the person doing this
    #   # is logged in and its their show
  
    #   # change it
       show.tickets = params[:tickets]
       show.date_time = params[:date_time]
       show.id = params[:id]
    #   # save it
       show.save
  
    #   session[:message] = {
    #     success: true,
    #     status: "good",
    #     message: "Successfully updated show ##{it.id}"
    #   }
  
    #   # redirect (to show show page maybe? or index maybe?)
       redirect '/shows'
     end
  
    # # destroy
     delete '/:id' do
    #   # find it 
     # booking = Booking.find_by show_id: params[:id]
      show = Show.find params[:id]
      bookings = show.bookings
      bookings.destroy
      show.destroy
      redirect '/shows'
      
    end
end



