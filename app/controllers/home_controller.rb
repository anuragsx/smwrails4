class HomeController < ApplicationController
	layout "application", :except => :index
  def index
    @featuredauto = Listing.where("featured = ? AND listingtype = ?", true, 'auto').first
    @featuredmoto = Listing.where("featured = ? AND listingtype = ?", true, 'moto').first
    @featuredmarine = Listing.where("featured = ? AND listingtype = ?", true, 'marine').first
    @featuredpower = Listing.where("featured = ? AND listingtype = ?", true, 'power').first
  	
  	#@automakes = Automodels.find(:all, :order => 'make ASC', :select => 'distinct make')
  	#@automodels = ""
  	#@autocategories = Autocategories.all
  	#@search = Listing.new_search(params[:search]) TODO
    @search = Listing.all
    unless @search.blank?
      @listings = @search #TODO
      @listings_count = @search.count #TODO
    end

  	
  	render :action => "index", :layout => "home"
  end

  def faq
  end

  def about
  end

  def contact
  	@message = Message.new
  end
  
  def admin
  	@user = current_user
  	if @user
  		if @user.admin
  			render
  		else
  			flash[:notice] = 'Restricted Page'
  			redirect_to(root_url)
  		end
  	else
  		flash[:notice] = 'Restricted Page'
 			redirect_to(root_url)
 		end
  end
  
end
