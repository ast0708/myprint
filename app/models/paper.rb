class Paper < ActiveRecord::Base
	has_and_belongs_to_many :suites
	
end