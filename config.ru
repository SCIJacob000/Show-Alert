require 'sinatra/base'


require './controllers/ApplicationController'
require './controllers/BandController'
require './controllers/ShowController'

require './models/BandModel'
require './models/ShowModel'


map ('/') {
  run ApplicationController
}