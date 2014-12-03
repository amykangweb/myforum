class User < ActiveRecord::Base
	include Gravtastic
	gravtastic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :posts, dependent: :destroy
   has_many :replies, dependent: :destroy

   validates :name, presence: true, length: {minimum: 2, maximum: 15}

   	def total_posts
		self.replies.count + self.posts.count
	end
end
