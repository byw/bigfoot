class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.string :title
      t.text :body
      t.integer :comments_count, :default => 0

      t.integer :score, :default => 0

      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
    add_index :topics, :user_id
    add_index :topics, :category_id
  end

  def self.down
    drop_table :topics
  end
end
