class Teacher < ActiveRecord::Base
	has_many :courses
	attr_accessible :department, :id, :name
end
