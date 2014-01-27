class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
  	belongs_to :course
  	belongs_to :user
  	validates :title, presence: true, length: { minimum: 5 }
  	attr_accessible :text, :title
end
