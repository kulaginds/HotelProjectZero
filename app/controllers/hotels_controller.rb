class HotelsController < ApplicationController
	before_action :require_fields, only: [:create, :update]
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	add_breadcrumb "Home", :root_path # добвлено в 10:42 6.07   Убирает крошку Home на главной странице
	add_breadcrumb "Hotels", :hotels_path

	def index
		@hotels = Hotel.page(params[:page])
	end

	def create
		@hotel=Hotel.new (require_fields)

		if @hotel.save
			redirect_to @hotel
		else
			render 'new'
		end
	end

	# def create
	# 	@user = User.find(params[:user_id])
	# 	@hotel = @user.hotels.create(require_fields)
	# 	redirect_to user_path(@hotel)
	# end

	def new
		add_breadcrumb "New hotel", :hotels_path
		@hotel=Hotel.new # for break form validation
	end

	def edit
		add_breadcrumb "Edit hotel", :hotels_path
		@hotel = Hotel.find(params[:id])
	end

	def show
		add_breadcrumb "Details hotel", :hotel_path
		@hotel = Hotel.find(params[:id])
	end

	def update
		# handle edit hotel
		@hotel = Hotel.find(params[:id])
		if @hotel.update(require_fields)
			redirect_to hotels_path
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
