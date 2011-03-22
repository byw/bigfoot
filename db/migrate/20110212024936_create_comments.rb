class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.text :body
      t.integer :score, :default => 0

      t.boolean :deleted, :default => false

      t.integer :user_id
      t.integer :topic_id
      t.integer :parent_id

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :topic_id
  end

  def self.down
    drop_table :comments
  end
end
