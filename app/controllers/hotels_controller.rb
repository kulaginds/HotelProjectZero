class HotelsController < ApplicationController

	def index
		# show list all hotels
		@hotels = Hotel.all
	end

	def create
		# handle new hotel
	end

	def new
		# show new hotel form
	end

	def edit
		# show edit hotel form
		@hotel = Hotel.find(params[:id])
	end

	def show
		# show hotel
		@hotel = Hotel.find(params[:id])
	end

	def update
		# handle edit hotel
	end

	def destroy
		# handle delete hotel
	end

end
