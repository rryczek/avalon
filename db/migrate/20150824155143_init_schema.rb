class InitSchema < ActiveRecord::Migration
  def up
    
    create_table "bookmarks", force: true do |t|
      t.integer  "user_id",       null: false
      t.string   "document_id"
      t.string   "title"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "user_type"
      t.string   "document_type"
    end
    
    add_index "bookmarks", ["user_id"], name: "index_bookmarks_on_user_id"
    
    create_table "courses", force: true do |t|
      t.string   "context_id"
      t.text     "label"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "title"
    end
    
    create_table "delayed_jobs", force: true do |t|
      t.integer  "priority",   default: 0
      t.integer  "attempts",   default: 0
      t.text     "handler"
      t.text     "last_error"
      t.datetime "run_at"
      t.datetime "locked_at"
      t.datetime "failed_at"
      t.string   "locked_by"
      t.string   "queue"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    
    add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"
    
    create_table "identities", force: true do |t|
      t.string   "email"
      t.string   "password_digest"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    
    create_table "ingest_batches", force: true do |t|
      t.string   "email"
      t.text     "media_object_ids"
      t.boolean  "finished",                    default: false
      t.boolean  "email_sent",                  default: false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "name",             limit: 50
    end
    
    create_table "role_maps", force: true do |t|
      t.string  "entry"
      t.integer "parent_id"
    end
    
    create_table "searches", force: true do |t|
      t.text     "query_params"
      t.integer  "user_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "user_type"
    end
    
    add_index "searches", ["user_id"], name: "index_searches_on_user_id"
    
    create_table "sessions", force: true do |t|
      t.string   "session_id",                  null: false
      t.text     "data",       limit: 16777215
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    
    add_index "sessions", ["session_id"], name: "index_sessions_on_session_id"
    add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at"
    
    create_table "stream_tokens", force: true do |t|
      t.string   "token"
      t.string   "target"
      t.datetime "expires"
    end
    
    create_table "superusers", force: true do |t|
      t.integer "user_id", null: false
    end
    
    create_table "users", force: true do |t|
      t.string   "username",   default: "", null: false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "provider"
      t.string   "uid"
      t.string   "email"
      t.string   "guest"
    end
    
    add_index "users", ["username"], name: "index_users_on_username", unique: true
    
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not revertable"
  end
end
