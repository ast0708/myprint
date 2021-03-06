module Spree
	class RelationshipsController < Spree::HomeController
		#before_action :logged_in_user
		protect_from_forgery except: :create
		def create
		    user = Spree::User.find(params[:followed_id])
		    spree_current_user.follow(user)
		    respond_to do |format|
		    	format.html {redirect_to :back}
		    	format.js	{@designer = user}
		    end
  		end

  		def destroy
    		user = Relationship.find(params[:id]).followed
    		spree_current_user.unfollow(user)
    		respond_to do |format|
		    	format.html {redirect_to :back}
		    	format.js	{@designer = user}
		    end
  		end
	end
end