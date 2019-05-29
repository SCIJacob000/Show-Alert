class BandController < ApplicationController


# user = User.find_by username: params[:username]
# pw = params[:password]
# set session
get '/:id/edit' do
	@band = Band.find params[:id]#again i believe this will work as long as the link that takes you here includes the bands id!
	erb :band_edit
end

get '/:id' do
	band = Band.find_by id: params[:id] #make sure to embed the id in the query string aka path of link that hits this route!
	erb :band_show
end



post '/login' do
  	band = Band.find_by username: params[:username]
  	pw=params[:password]
  	if band && band.authenticate(pw)
  	session[:logged_in] = true
  	session[:username]= band.username
  	session[:message]= {
  		success: true,
  		message: "You are logged in as #{band.username}"
  	}
  	else
        session[:message] = {
           success: false,
           message: "Invalid Log-In Credentials Please Try Again!"
    }
        redirect '/bands'
    end
  
end

#this is essentially the "new band" page
get '/register' do
   erb :register
end
  
#this is essentially the create route for a "new band"
post '/register' do
	band = Band.find_by username: params[:username]
    if !band
  	band = Band.new
    band.username = params[:username]
    band.password = params[:password]
    band.description = params[:description]
  	band.save
  	session[:logged_in]= true
  	session[:username]= band.username
  	session[:message]={
  		success: true,
  		message: "Welcome to the family #{band.username}"
  	}
  	redirect '/bands'
  	else
  	session[:message]={
  		success: false,
  		message: "Sorry there is another band with that name already and they rock harder than you!"
  	}
  	redirect '/bands/register'
  	end
end

get '/logout' do
    session.destroy
    session[:message] = {
      success: true,
      message: "Rock On Dudes" #...so that we can use it here
    }
      redirect '/bands/login'
end


put '/:id' do 
	band = Band.find params[:id]
	band.name = params[:name]
	band.password = params[:password]
	band.description = params[:description]
	band.save
	session[:message]={
		success: true,
		message: "Updates to band info successfull!"
	}
	redirect '/bands'
end

delete '/:id' do 
	band = Band.find params[:id]
	band.destroy
	redirect '/bands'
end

get '/' do
	bands = Band.all 
	erb :band_index
end
end