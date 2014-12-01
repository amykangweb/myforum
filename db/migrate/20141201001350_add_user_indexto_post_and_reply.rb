class AddUserIndextoPostAndReply < ActiveRecord::Migration
  def change
  	add_reference :posts, :user, index: true
  	add_reference :replies, :user, index: true
  end
end
