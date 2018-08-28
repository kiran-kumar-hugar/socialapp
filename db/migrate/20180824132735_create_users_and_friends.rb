class CreateUsersAndFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :users_friends, id: false do |t|
    	t.belongs_to :user, index: true
      t.belongs_to :friend, index: true
    end
  end
end
