class Reply < ActiveRecord::Base
	default_scope -> {order('created_at DESC')}
	validates :body, presence: true, length: {minimum: 2, maximum: 2000}
	
	belongs_to :post
	belongs_to :user
end
