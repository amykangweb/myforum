class Post < ActiveRecord::Base
	validates :title, :content, presence: true
	validates :title, length: {minimum: 2, maximum: 50}
	validates :content, length: {minimum: 5, maximum: 500}
end