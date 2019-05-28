class ApplicationController < Sinatra::Base
  require 'bundler'
  Bundler.require()

  enable :sessions

  ActiveRecord::Base.establish_connection(
  	:adapter => 'postgresql',
  	:database => 'show_stopper'
  )

  use Rack::MethodOverride # we "use" middleware here, just like in express
  set :method_override, true

  # teach it how to find templates
  set :views, File.expand_path('../../views', __FILE__)

  # teach it how to find static assets
  set :public_dir, File.expand_path('../../public', __FILE__)

  get '/' do 
    # render a splash page or home page    
    redirect '/items'
  end


  # here's why pry is amazing
  get '/test' do
    some_text = "grow food it'll change your life"

    # pry gem lets us use this command "binding.pry"
    # it pauses execution and opens a REPL in the scope of this route
    # at this exact spot in the code
    # • you can inspect variables
    # • you can test DB/ORM queries !!!! 
    # • i.e. test your models
    # • etc
    # be sure to type exit on the terminal to resume execution back
    # because the client is still waiting for a response from 
    # this route

    binding.pry # STOPS EXECUTION, OPENS A REPL IN YOUR TERMINAL -- type exit in your terminal to exit pry and complete execution of the route

    # this response will get sent once you exit
    "pry has finished -- here's some_text #{some_text}"

  end

  get '*' do
    # response = ""
    # 404.times { response += " 404" }
    # response # figure out how to set status on this response
    #           # res.status(404).send('404 page not found')
    halt 404
  end





end