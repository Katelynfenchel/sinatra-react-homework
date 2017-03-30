
require 'sinatra/base'

require './controllers/ApplicationController'
require './controllers/PlaceController'

require './models/PlaceModel'


map('/') {run ApplicationController}
map('/place') {run PlaceController}