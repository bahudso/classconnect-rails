class Course < ActiveRecord::Base
  belongs_to :teacher
  has_many :posts
  has_and_belongs_to_many :user
  attr_accessible :name, :section
end
