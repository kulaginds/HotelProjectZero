class StaticPagesController < ApplicationController
  def home
  	# add_breadcrumb "home", :root_path
  end

  def help
  	# add_breadcrumb "home", :help_path
  end

  def about
  	# add_breadcrumb "home", :about_path
  end

  def contact
  	# add_breadcrumb "home", :contact_path
  end
end
