class Lab1Controller < ApplicationController
	include Lab1Helper

	def index
	end

	def show
		render template: "lab1/#{params[:page]}"
	end

	def return_info
		@headers = request.env.select { |key, val| key.match("^HTTP.*")}
		@params = params.except(:controller, :action, :lab1)
		@body = request.body
		render 'return_info', layout: false, formats: [:text]
	end 

	def redirect
		if params.has_key?("fancypig")
			redirect_to "https://media.giphy.com/media/uMsij8LfHNNde/giphy_s.gif"
		elsif params.has_key?("byucs")
			redirect_to "https://cs.byu.edu/"
		elsif params.has_key?("random")
			redirect_to "https://c.xkcd.com/random/comic/"
		end
	end

	def version
		accept_header = request.env["HTTP_ACCEPT"]
		v1 = {"version"=> "v1" }
		v2 = {"version"=> "v2" }
		if accept_header.include? "application/vnd.byu.cs462.v1+json"
			render :json => v1
		elsif accept_header.include? "application/vnd.byu.cs462.v2+json"
			render :json => v2
		end			
	end
end