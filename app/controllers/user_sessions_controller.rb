class UserSessionsController < ApplicationController
  # GET /user_sessions/new
  # GET /user_sessions/new.xml
  def new
    @user_session = UserSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_session }
    end
  end

  # POST /user_sessions
  # POST /user_sessions.xml
  def create
    @user_session = UserSession.new(params[:user_session])

    respond_to do |format|
      if @user_session.save
        flash[:notice] = 'Login successful'
        format.html { #If user logging in has listing(s), redirect to What I Have, else redirect to What I Want
        							@user = current_user
        							@listing = @user.listings
        							if @listing.exists?
        								redirect_to listings_url
        							else
        								redirect_to whatiwant_url
        							end }
        format.xml  { render :xml => @user_session, :status => :created, :location => @user_session }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.xml
  def destroy
  	if current_user
	    @user_session = UserSession.find
	    @user_session.destroy
			flash[:notice] = 'Logout successful'
	    respond_to do |format|
	      format.html { redirect_to root_url }
	      format.xml  { head :ok }
	    end
	  else
	  	redirect_to root_url
	  end
  end
end
