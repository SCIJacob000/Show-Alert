require 'sinatra/base'


require './controllers/ApplicationController'
 require './controllers/ShowController'
# require './controllers/BookingController'
# require './controllers/BandController'

require './models/ShowModel'
# require './models/BookingModel'
# require './models/BandModel'




map ('/') {
  run ApplicationController
}

map ('/shows') {
  run ShowController
}

# map ('/bookings'){
# 	run BookingController
# }

<<<<<<< Updated upstream
# map ('/bands') {
#   run BandController
# }
=======
map ('/bands') {
  run BandController
}
>>>>>>> Stashed changes



