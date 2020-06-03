class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :title
      t.integer :favorites
      t.integer :retweets

      t.timestamps
    end
  end
end
