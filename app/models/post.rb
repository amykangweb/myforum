class Post < ActiveRecord::Base
	default_scope -> {order('created_at DESC')}
	validates :title, :content, presence: true
	validates :title, length: {minimum: 2, maximum: 50}
	validates :content, length: {minimum: 5, maximum: 2000}

	has_many :replies, dependent: :destroy
	belongs_to :user
end
