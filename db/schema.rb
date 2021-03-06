# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110215075243) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "url_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comment_votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "comment_id"
    t.integer  "topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.integer  "score",      :default => 0
    t.boolean  "deleted",    :default => false
    t.integer  "user_id"
    t.integer  "topic_id"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["topic_id"], :name => "index_comments_on_topic_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "topics", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "comments_count", :default => 0
    t.integer  "score",          :default => 0
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "topics", ["category_id"], :name => "index_topics_on_category_id"
  add_index "topics", ["user_id"], :name => "index_topics_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "username",                                               :null => false
    t.string   "email",                               :default => "",    :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",    :null => false
    t.string   "password_salt",                       :default => "",    :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "comment_karma",                       :default => 0
    t.integer  "topic_karma",                         :default => 0
    t.boolean  "admin",                               :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username"

end
