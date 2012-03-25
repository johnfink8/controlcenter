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

ActiveRecord::Schema.define(:version => 20120324172851) do

  create_table "aws_account", :force => true do |t|
    t.string "access_key_id",     :null => false
    t.string "secret_access_key", :null => false
  end

  create_table "aws_accounts", :force => true do |t|
    t.string "access_key_id",     :null => false
    t.string "secret_access_key", :null => false
  end

  create_table "build_scripts", :force => true do |t|
    t.string "name"
    t.text   "script", :null => false
  end

  create_table "ec2_amis", :force => true do |t|
    t.string  "name"
    t.string  "amiID"
    t.integer "aws_account_id"
  end

  add_index "ec2_amis", ["amiID"], :name => "index_ec2_amis_on_amiID"
  add_index "ec2_amis", ["aws_account_id"], :name => "index_ec2_amis_on_aws_account_id"

  create_table "ec2_instances", :force => true do |t|
    t.string  "name"
    t.string  "instanceid"
    t.integer "ec2_ami_id",     :null => false
    t.integer "key_pair_id",    :null => false
    t.string  "username"
    t.integer "aws_account_id"
  end

  add_index "ec2_instances", ["aws_account_id"], :name => "index_ec2_instances_on_aws_account_id"
  add_index "ec2_instances", ["ec2_ami_id"], :name => "index_ec2_instances_on_ec2_ami_id"
  add_index "ec2_instances", ["key_pair_id"], :name => "index_ec2_instances_on_key_pair_id"

  create_table "key_pairs", :force => true do |t|
    t.string  "name",           :limit => 127
    t.text    "private_key"
    t.integer "aws_account_id"
  end

  add_index "key_pairs", ["aws_account_id"], :name => "index_key_pairs_on_aws_account_id"
  add_index "key_pairs", ["name"], :name => "index_ec2_instances_on_name"

  create_table "posts", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
