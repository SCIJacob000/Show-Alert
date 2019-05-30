## ALL other controllers in your app will inherit from Application Controller

class ShowController < ApplicationController
  
    # this is a 'before' filter, it will be run 
    # for all routes before the request is processed
    # you can customize it to only run on certain routes or
    # under certain circumstances
  
    # before do
    #   puts "before filter is running"
  
    #   if !session[:logged_in]
    #     # message
    #     session[:message] = {
    #       success: false,
    #       status: "neutral",
    #       message: "You must be logged in to do that."
    #     }
    #     #redirect
    #     redirect '/users/login'
  
    #   end
  
    # end
  

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
      booking = Booking.find_by show_id: params[:id]
      show = Show.find params[:id]
      bookings = show.bookings
      puts "This is the booking that is to be destroyed"
      puts bookings
      bookings.destroy
      show.destroy
      redirect '/shows'
  
    end
  
    # after do
    #   puts "after filter is running"
    # end
  
end




#   # user = User.find_by username: params[:username]
# # pw = params[:password]
# # set session
# get '/:id/edit' do
#     @band = Band.find params[:id]#again i believe this will work as long as the link that takes you here includes the bands id!
#     erb :band_edit
# end

# get '/:id' do
#     band = Band.find_by id: params[:id] #make sure to embed the id in the query string aka path of link that hits this route!
#     erb :band_show
# end



#  post '/login' do
#       band = Band.find_by username: params[:username]
#       pw=params[:password]
#   if band && band.authenticate(pw)
#       session[:logged_in] = true
#       session[:username]= band.username
#       session[:message]= {
#           success: true,
#           message: "You are logged in as #{band.username}"
#       }
#   else
#         session[:message] = {
#            success: false,
#            message: "Invalid Log-In Credentials Please Try Again!"
#     }
#         redirect '/bands'
#     end
  
#   end

# #this is essentially the "new band" page
# get '/register' do
#    erb :register
# end
  
# #this is essentially the create route for a "new band"
# post '/register' do
#     band = Band.find_by username: params[:username]
#     if !band
#       band = Band.new
#     band.username = params[:username]
#     band.password = params[:password]
#     band.description = params[:description]
#       band.save
#       session[:logged_in]= true
#       session[:username]= band.username
#       session[:message]={
#           success: true,
#           message: "Welcome to the family #{band.username}"
#       }
#       redirect '/bands'
#   else
#       session[:message]={
#           success: false,
#           message: "Sorry there is another band with that name already and they rock harder than you!"
#       }
#       redirect '/bands/register'
#   end
# end

# get '/logout' do
#     session.destroy
#     session[:message] = {
#       success: true,
#       message: "Rock On Dudes" #...so that we can use it here
#     }
#       redirect '/bands/login'
# end


# put '/:id' do 
#     band = Band.find params[:id]
#     band.name = params[:name]
#     band.password = params[:password]
#     band.description = params[:description]
#     band.save
#     session[:message]={
#         success: true,
#         message: "Updates to band info successfull!"
#     }
#     redirect '/bands'
# end

# delete '/:id' do 
#     band = Band.find params[:id]
#     band.destroy
#     redirect '/bands'
# end

# get '/' do
#     bands = Band.all 
#     erb :band_index
# end
# end