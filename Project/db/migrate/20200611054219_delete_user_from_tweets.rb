class DeleteUserFromTweets < ActiveRecord::Migration[6.0]
  def change
    remove_column :tweets, :user
  end
end
