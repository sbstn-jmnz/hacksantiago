class Homeapi < ActiveRecord::Base
	attr_accessor :tag
	 validates :tag, presence: true
 end
