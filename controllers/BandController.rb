class BandController < ApplicationController


# user = User.find_by username: params[:username]
# pw = params[:password]
# set session

 post '/login' do
  	band = Band.find_by username: params[:username]
  	pw=params[:password]
  if user && user.authenticate(pw)
  	session[:logged_in] = true
  	session[:username]= band.username
  	session[:message]= {
  		success: true,
  		message: "You are logged in as #{band.username}"
  	}
  else{
        session[:message] = {
           success: false,
           message: "Invalid Log-In Credentials Please Try Again!"
        }
    }
        redirect '/bands'
    end
  
  end


get '/register' do
   erb :register
end
  

post '/register' do
	band = Band.find_by username: params[:username]
    if !band
  	band = Band.new
    user.username = params[:username]
  
#         # HEY: if has_secure_password is specified in User model
#         # .password= setter method will automatically encrypt
#         # the password for you and store it in a field on the 
#         # User model called "password_digest"
#         user.password = params[:password]
  
#         user.save
  
#         # add stuff to session: loggedin, username, message
#         session[:logged_in] = true
#         session[:username] = user.username
#         session[:message] = {
#           success: true,
#           status: "good",
#           message: "Welcome to the site, you are now logged in as #{user.username}."
#         }
  
#         # redirect to the site
#         redirect '/items'
  
#       # else if user does exist
#       else 
#         # session message -- username taken
#         session[:message] = {
#           success: false,
#           status: "bad",
#           message: "Sorry, username #{params[:username]} is already taken."
#         }
#         # redirect to register so they can try again
#         redirect '/users/register'
  
#       end
  
#     end
  
#     # logout
#     get '/logout' do
      
#       username = session[:username] # grab username before destroying session...
  
#       session.destroy
  
#       session[:message] = {
#         success: true,
#         status: "neutral",
#         message: "User #{username} logged out." #...so that we can use it here
#       }
  
#       redirect '/users/login'
  
#     end
  
#   end
end