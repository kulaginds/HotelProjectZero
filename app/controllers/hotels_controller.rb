class HotelsController < ApplicationController

	before_action :require_fields, only: [:create, :update]
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

	add_breadcrumb "hotels", :hotels_path

	def index
		@hotels = Hotel.order(:rating).page(params[:page])
	end

	def create
		@hotel=Hotel.new (require_fields)

		if @hotel.save
			redirect_to @hotel
		else
			render 'new'
		end
	end

	def new
		add_breadcrumb "new hotel", :hotels_path
		@hotel=Hotel.new # for break form validation
	end

	def edit
		add_breadcrumb "edit hotel", :hotels_path
		@hotel = Hotel.find(params[:id])
	end

	def show
		add_breadcrumb "details hotel", :hotel_path
		@hotel = Hotel.find(params[:id])
	end

	def update
		# handle edit hotel
		@hotel = Hotel.find(params[:id])
		if @hotel.update(require_fields)
			redirect_to @hotel
		else
			render 'edit'
		end
	end

	def destroy
		# handle delete hotel
		@hotel = Hotel.find(params[:id])
		if @hotel.destroy
			redirect_to hotels_path
		else
			redirect_to @hotel
		end
	end

	private

	def require_fields
		params.require(:hotel).permit(:title, :breakfast, :description, :price, :photo, :country, :state, :city, :street)
	end

end
