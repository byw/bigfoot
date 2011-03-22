class CreateCommentVotes < ActiveRecord::Migration
  def self.up
    create_table :comment_votes do |t|
      t.integer :user_id
      t.integer :comment_id
      t.integer :topic_id

      t.timestamps
    end
  end

  def self.down
    drop_table :comment_votes
  end
end
