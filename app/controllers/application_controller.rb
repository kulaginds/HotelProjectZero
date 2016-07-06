class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # add_breadcrumb "Home", :root_path

	def index
		# load top5 hotels
    @hotels = Hotel.joins('INNER JOIN rating_caches ON rating_caches.cacheable_id=hotels.id').order('rating_caches.avg').limit(5)
	end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_in) do |user_params|
        user_params.permit(:username, :email)
      end
    end
end
