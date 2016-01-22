class Lab1Controller < ApplicationController
	def index
	end

	def show
		render template: "lab1/#{params[:page]}"
	end
end