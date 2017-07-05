class AddDetailsToFriendship < ActiveRecord::Migration[5.0]
  def change
    add_column :friendships, :follower_id, :integer
    add_column :friendships, :friend_id, :integer
  end
end
