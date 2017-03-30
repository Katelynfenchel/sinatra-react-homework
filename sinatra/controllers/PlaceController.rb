class PlaceController < ApplicationController

	options "*" do
    response.headers["Allow"] = "HEAD,GET,POST,PUT,PATCH,DELETE,OPTIONS"

    # Needed for AngularJS
    response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
    response['Access-Control-Allow-Origin'] = '*'

    "hello!"
  end

	get '/'do
	response['Access-Control-Allow-Origin'] = '*'
	sends json
		content_type :json

		@where = Place.all
		@where.to_json

		
	end
	 # get a single row if needed
    get '/:id' do
         content_type :json
 
         id = params[:id]
         @where = Place.find(id)
         @where.to_json
    end

     post '/' do
        response['Access-Control-Allow-Origin'] = '*'
         content_type :json
 
         puts JSON.parse(request.body.read)
         @where = Place.new
         @where.title = JSON.parse(request.body.read)
         @where.save
 
         @where = Place.all
         @where.to_json
    end


	patch '/:id' do
         response['Access-Control-Allow-Origin'] = '*'
         content_type :json
 
         id = params[:id]
 
         @where = Place.find(id)
         @where.title = params[:title]
         @where.save
 
         @where= Place.all
         @where.to_json
    end

    delete '/:id' do
     	response['Access-Control-Allow-Origin'] = '*'
        content_type :json

        id = params[:id]
        @where =Place.find(id)
        @where.destory

         @where= Place.all
         @where.to_json
	end



end
