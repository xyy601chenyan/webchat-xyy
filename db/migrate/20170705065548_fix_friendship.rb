class FixFriendship < ActiveRecord::Migration[5.0]
  def change
    rename_column :friendships,:follower_id,:user_id
  end
end
