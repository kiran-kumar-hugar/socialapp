class AddUserIdToFeed < ActiveRecord::Migration[5.2]
  def change
  	add_column :friends, :user_id, :integer
  end
end
