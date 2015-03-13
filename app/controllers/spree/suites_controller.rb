module Spree
	class SuitesController < Spree::HomeController
		
		helper Spree::ReviewsHelper
		[:avg_rating, :reviews_count].each { |attrib| Spree::PermittedAttributes.product_attributes << attrib }
		
		def show
			@suites = Suite.retrieve_suites
			@suite = Suite.friendly.find(params[:id])
			@prds = @suite.spree_products
			@scat = @suite.colors
			@trm = @suite.trims
			@pap = @suite.papers
			@dim = @suite.dimensions
			@review = @suite.reviews.new
        end
	end
end
