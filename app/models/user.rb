class User < ActiveRecord::Base
  has_many :posts
  has_and_belongs_to_many :courses
  attr_accessible :email, :username
end
