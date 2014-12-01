class Reply < ActiveRecord::Base
	validates :body, presence: true, length: {minimum: 2, maximum: 500}
	
	belongs_to :post
	belongs_to :user
end
