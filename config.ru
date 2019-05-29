require 'sinatra/base'


require './controllers/ApplicationController'
require './controllers/ShowController'
# require './controllers/BookingController'
require './controllers/BandController'

require './models/ShowModel'
# require './models/BookingModel'
require './models/BandModel'




map ('/') {
  run ApplicationController
}

map ('/shows') {
  run ShowController
}

map ('/bands') {
  run BandController
}

# map ('/bookings'){
# 	run BookingController
# }




