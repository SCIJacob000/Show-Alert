require 'sinatra/base'


require './controllers/ApplicationController'
require './controllers/BandController'
require './controllers/ShowController'
require './controllers/BookingController'

require './models/BandModel'
require './models/ShowModel'
require './models/BookingModel'


map ('/') {
  run ApplicationController
}

map ('/bands') {
  run BandController
}

map ('/shows') {
  run ShowController
}
map ('/bookings'){
	run BookingController
}
