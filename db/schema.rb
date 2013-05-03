# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130503134144) do

  create_table "games", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "players", :force => true do |t|
    t.integer  "game_id"
    t.integer  "inventory",  :default => 12
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "week_records", :force => true do |t|
    t.integer  "player_id",            :null => false
    t.integer  "week",                 :null => false
    t.integer  "delivery_to_supplier", :null => false
    t.integer  "order_from_customer",  :null => false
    t.integer  "delivery_to_customer", :null => false
    t.integer  "order_to_supplier"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

end
