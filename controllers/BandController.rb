# class UserController < ApplicationController

#     # shows login page
#     get '/login' do
#       erb :login
#     end
  
#     # do the login 
#     post '/login' do
  
#       # find user by username
#       user = User.find_by username: params[:username]
  
#       # pp user # help us as devs see whether its a username or pw issue
#       # or you could use binding.pry
  
#       pw = params[:password]
  
#       # if the user exists and password is correct --
#       # password is now being checked using bcrypt
#       if user && user.authenticate(pw)
#         # add stuff to session: loggedin, username, message
#         session[:logged_in] = true
#         session[:username] = user.username
#         session[:message] = {
#           success: true,
#           status: "good",
#           message: "Logged in as #{user.username}"
#         }
#         # redirect to /items
#         redirect '/items'
  
#       # else 
#       else
#         # error -- incorrect un or pw
#         session[:message] = {
#           success: false,
#           status: "bad",
#           message: "Invalid username or password."
#         }
        
#         # redirect to /login so they can reattempt
#         redirect '/users/login'
#       end
  
#     end
  
  
#     # shows register 
#     get '/register' do
#       erb :register
#     end
  
#     # do registration
#     post '/register' do
  
#       # check if user exists 
#       user = User.find_by username: params[:username]
#             # User.find_by({ :username => params[:username] })
  
#       # if user doesn't exist
#       if !user
  
#         # create user 
#         user = User.new
#         user.username = params[:username]
  
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