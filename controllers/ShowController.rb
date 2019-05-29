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
    get '/shows' do
      # get all shows from db
      
      # show = Show.find_by({ :show_id => params[:id] })
      # @shows = booking.show_id # just logged in booking's shows
  
      erb :show_index
    end
  
    # edit
    # get '/:id/edit' do
    #   # get show from db in an instance var
    #   @show = Show.find params[:id]
    #   # render a form with show data
    #   erb :show_edit
    # end
  
    # create
    post '/' do
      # create new show
      # new_show = Show.new
      # set fields
      # new_show.show_id = params[:id]
      # new_show.date_time = params[:date_time]
      # new_show.tickets = params[:tickets]
      
      # figure out who's logged in and make this be one of 
      # their shows
      # logged_in_band = Band.find_by({:username => session[:username]})
  
      # new_show.band_id = logged_in_band.id
  
      # save
      # new_show.save # id is now defined on this instance of the model
  
      # session[:message] = {
      #   success: true,
      #   status: "good",
      #   message: "Successfully created show ##{new_show.id}"
      # }
  
      # redirect (to index perhaps?)
      redirect '/shows'
    end
  
    # new -- 
    get '/new' do
      # just render template that has form
      erb :show_new
    end
  
    # show -- 
      # get show from db in a var
      # render show page with it
      
    # update 
    # put '/:id' do
    #   # find it
    #   it = Show.find params[:id]
      
    #   # in the API -- be sure to check that the person doing this
    #   # is logged in and its their show
  
    #   # change it
    #   it.content = params[:content]
    #   # save it
    #   it.save
  
    #   session[:message] = {
    #     success: true,
    #     status: "good",
    #     message: "Successfully updated show ##{it.id}"
    #   }
  
    #   # redirect (to show show page maybe? or index maybe?)
    #   redirect '/shows'
    # end
  
    # # destroy
    # delete '/:id' do
    #   # find it
    #   show = Show.find params[:id]
      
    #   # in the API -- be sure to check that the person doing this
    #   # is logged in and its their show
  
    #   # destroy it
    #   show.destroy
  
    #   session[:message] = {
    #     success: true,
    #     status: "good",
    #     message: "Successfully destroyed show ##{show.id}"
    #   }
  
    #   # redirect (to index perhaps?)
    #   redirect '/shows'
  
    # end
  
    # after do
    #   puts "after filter is running"
    # end
  
  end