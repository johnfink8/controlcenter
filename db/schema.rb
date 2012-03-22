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

ActiveRecord::Schema.define(:version => 20120225204411) do

  create_table "ec2_amis", :force => true do |t|
    t.string   "name"
    t.string   "amiID"
  end


  create_table "ec2_instances", :force => true do |t|
    t.string   "name"
    t.string   "instanceid"
    t.integer  "ec2_ami_id", :null => false
    t.integer  "key_pair_id", :null => false
    t.string   "username"
  end
  add_index "ec2_instances", ["ec2_ami_id"], :name => "index_ec2_instances_on_ec2_ami_id"
  add_index "ec2_instances", ["key_pair_id"], :name => "index_ec2_instances_on_key_pair_id"

  
  create_table "key_pairs", :force => true do |t|
    t.string "name", :limit => 127
    t.text "private_key", :limit => 1024
  end
  add_index "key_pairs", ["name"], :name => "index_ec2_instances_on_name"
  
  create_table "build_scripts", :force => true do |t|
    t.string    "name"
    t.text      "script", :null => false
  end

end
