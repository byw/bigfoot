class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
=begin
      t.string :username, :null => false
      t.string :email
      t.string :crypted_password, :null => false
      t.string :password_salt, :null => false
      t.string :persistence_token, :null => false
      t.integer :login_count, :default => 0, :null => false
      t.datetime :last_request_at
      t.datetime :last_login_at
      t.datetime :current_login_at
      t.string :last_login_ip
      t.string :current_login_ip
=end
      t.string :username, :null => false
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable


      t.integer :comment_karma, :default => 0
      t.integer :topic_karma, :default => 0

      t.boolean :admin, :default => false

      t.timestamps
    end
    add_index :users, :username
    add_index :users, :email
    add_index :users, :reset_password_token, :unique => true
  end

  def self.down
    drop_table :users
  end
end
