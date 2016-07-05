class Api::V1::HotelsController < ApplicationController

	before_action :require_fields, only: [:create, :update]
	respond_to :json

	def index
		hotels = Hotel.all
		render json: hotels, status: 200
	end

	def create
		if user_signed_in?
			hotel=Hotel.new (require_fields)

			if hotel.save
				render json: {success: true}, status: 200
			else
				render json: {success: false}, status: 400
			end
		else
			render json: {success: false}, status: 401
		end
	end

	def show
		hotel = Hotel.find(params[:id])
		render json: hotel, status: 200
	end

	def update
		if user_signed_in?
			hotel = Hotel.find(params[:id])
			if hotel.update(require_fields)
				render json: {success: true}, status: 200
			else
				render json: {success: false}, status: 400
			end
		else
			render json: {success: false}, status: 401
		end
	end

	def destroy
		if user_signed_in?
			hotel = Hotel.find(params[:id])
			if hotel.destroy
				render json: {success: true}, status: 200
			else
				render json: {success: false}, status: 400
			end
		else
			render json: {success: false}, status: 401
		end
	end

	private

	def require_fields
		params.require(:hotel).permit(:title, :breakfast, :description, :price, :photo, :country, :state, :city, :street)
	end

end