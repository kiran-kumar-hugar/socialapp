class FixCoulmnNameOfFriend < ActiveRecord::Migration[5.2]
  def change
  	rename_column :friends, :friendsid, :friend_id
  end
end
