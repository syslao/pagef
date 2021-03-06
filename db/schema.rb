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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170413095848) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",   limit: 4,   null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "pageflow_accounts", force: :cascade do |t|
    t.string   "name",                   limit: 255,   default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "default_file_rights",    limit: 255,   default: "", null: false
    t.string   "landing_page_name",      limit: 255,   default: "", null: false
    t.integer  "default_theming_id",     limit: 4
    t.text     "features_configuration", limit: 65535
    t.integer  "users_count",            limit: 4,     default: 0,  null: false
    t.integer  "entries_count",          limit: 4,     default: 0,  null: false
  end

  add_index "pageflow_accounts", ["default_theming_id"], name: "index_pageflow_accounts_on_default_theming_id", using: :btree

  create_table "pageflow_accounts_themes", id: false, force: :cascade do |t|
    t.integer "account_id", limit: 4
    t.integer "theme_name", limit: 4
  end

  create_table "pageflow_audio_files", force: :cascade do |t|
    t.integer  "entry_id",                              limit: 4
    t.integer  "uploader_id",                           limit: 4
    t.string   "attachment_on_filesystem_file_name",    limit: 255
    t.string   "attachment_on_filesystem_content_type", limit: 255
    t.integer  "attachment_on_filesystem_file_size",    limit: 8
    t.datetime "attachment_on_filesystem_updated_at"
    t.string   "attachment_on_s3_file_name",            limit: 255
    t.string   "attachment_on_s3_content_type",         limit: 255
    t.integer  "attachment_on_s3_file_size",            limit: 8
    t.datetime "attachment_on_s3_updated_at"
    t.integer  "job_id",                                limit: 4
    t.string   "state",                                 limit: 255
    t.decimal  "encoding_progress",                                 precision: 5, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encoding_error_message",                limit: 255
    t.integer  "duration_in_ms",                        limit: 4
    t.string   "format",                                limit: 255
    t.string   "rights",                                limit: 255,                         default: "", null: false
    t.integer  "confirmed_by_id",                       limit: 4
  end

  create_table "pageflow_chapters", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",      limit: 4,     default: 0,  null: false
    t.string   "title",         limit: 255,   default: "", null: false
    t.text     "configuration", limit: 65535
    t.integer  "storyline_id",  limit: 4
  end

  add_index "pageflow_chapters", ["storyline_id"], name: "index_pageflow_chapters_on_storyline_id", using: :btree

  create_table "pageflow_chart_scraped_sites", force: :cascade do |t|
    t.string   "url",                          limit: 255
    t.string   "state",                        limit: 255
    t.string   "html_file_file_name",          limit: 255
    t.string   "html_file_content_type",       limit: 255
    t.integer  "html_file_file_size",          limit: 4
    t.datetime "html_file_updated_at"
    t.string   "javascript_file_file_name",    limit: 255
    t.string   "javascript_file_content_type", limit: 255
    t.integer  "javascript_file_file_size",    limit: 4
    t.datetime "javascript_file_updated_at"
    t.string   "stylesheet_file_file_name",    limit: 255
    t.string   "stylesheet_file_content_type", limit: 255
    t.integer  "stylesheet_file_file_size",    limit: 4
    t.datetime "stylesheet_file_updated_at"
    t.string   "csv_file_file_name",           limit: 255
    t.string   "csv_file_content_type",        limit: 255
    t.integer  "csv_file_file_size",           limit: 4
    t.datetime "csv_file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "use_custom_theme",                         default: true, null: false
  end

  create_table "pageflow_edit_locks", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "entry_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pageflow_edit_locks", ["entry_id"], name: "index_pageflow_edit_locks_on_entry_id", using: :btree
  add_index "pageflow_edit_locks", ["user_id"], name: "index_pageflow_edit_locks_on_user_id", using: :btree

  create_table "pageflow_entries", force: :cascade do |t|
    t.string   "title",                  limit: 255,   default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",                   limit: 255,                null: false
    t.integer  "account_id",             limit: 4
    t.integer  "folder_id",              limit: 4
    t.integer  "theming_id",             limit: 4
    t.text     "features_configuration", limit: 65535
    t.string   "password_digest",        limit: 255
    t.datetime "first_published_at"
    t.datetime "edited_at"
  end

  add_index "pageflow_entries", ["account_id"], name: "index_pageflow_entries_on_account_id", using: :btree
  add_index "pageflow_entries", ["folder_id"], name: "index_pageflow_entries_on_folder_id", using: :btree
  add_index "pageflow_entries", ["slug"], name: "index_pageflow_entries_on_slug", unique: true, using: :btree
  add_index "pageflow_entries", ["theming_id"], name: "index_pageflow_entries_on_theming_id", using: :btree

  create_table "pageflow_external_links_sites", force: :cascade do |t|
    t.integer  "perma_id",        limit: 4
    t.integer  "revision_id",     limit: 4
    t.text     "url",             limit: 65535
    t.string   "title",           limit: 255
    t.string   "thumbnail",       limit: 255
    t.text     "description",     limit: 65535
    t.boolean  "open_in_new_tab"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pageflow_external_links_sites", ["revision_id"], name: "index_pageflow_external_links_sites_on_revision_id", using: :btree

  create_table "pageflow_file_usages", force: :cascade do |t|
    t.integer  "revision_id", limit: 4
    t.integer  "file_id",     limit: 4
    t.string   "file_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pageflow_file_usages", ["file_id", "file_type"], name: "index_pageflow_file_usages_on_file_id_and_file_type", using: :btree
  add_index "pageflow_file_usages", ["revision_id"], name: "index_pageflow_file_usages_on_revision_id", using: :btree

  create_table "pageflow_folders", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "account_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pageflow_folders", ["account_id"], name: "index_pageflow_folders_on_account_id", using: :btree

  create_table "pageflow_image_files", force: :cascade do |t|
    t.integer  "entry_id",                            limit: 4
    t.integer  "uploader_id",                         limit: 4
    t.string   "unprocessed_attachment_file_name",    limit: 255
    t.string   "unprocessed_attachment_content_type", limit: 255
    t.integer  "unprocessed_attachment_file_size",    limit: 8
    t.datetime "unprocessed_attachment_updated_at"
    t.string   "processed_attachment_file_name",      limit: 255
    t.string   "processed_attachment_content_type",   limit: 255
    t.integer  "processed_attachment_file_size",      limit: 8
    t.datetime "processed_attachment_updated_at"
    t.string   "state",                               limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "width",                               limit: 4
    t.integer  "height",                              limit: 4
    t.string   "rights",                              limit: 255, default: "", null: false
  end

  create_table "pageflow_memberships", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "entry_id",   limit: 4
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pageflow_memberships", ["entry_id"], name: "index_pageflow_memberships_on_entry_id", using: :btree
  add_index "pageflow_memberships", ["user_id"], name: "index_pageflow_memberships_on_user_id", using: :btree

  create_table "pageflow_pages", force: :cascade do |t|
    t.integer  "chapter_id",            limit: 4
    t.string   "template",              limit: 255,   default: "",   null: false
    t.text     "configuration",         limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",              limit: 4,     default: 0,    null: false
    t.boolean  "display_in_navigation",               default: true
    t.integer  "perma_id",              limit: 4
  end

  add_index "pageflow_pages", ["chapter_id"], name: "index_pageflow_pages_on_chapter_id", using: :btree
  add_index "pageflow_pages", ["perma_id"], name: "index_pageflow_pages_on_perma_id", using: :btree

  create_table "pageflow_panorama_packages", force: :cascade do |t|
    t.integer  "entry_id",                              limit: 4
    t.integer  "uploader_id",                           limit: 4
    t.string   "state",                                 limit: 255
    t.string   "rights",                                limit: 255
    t.string   "attachment_on_filesystem_file_name",    limit: 255
    t.string   "attachment_on_filesystem_content_type", limit: 255
    t.integer  "attachment_on_filesystem_file_size",    limit: 8
    t.datetime "attachment_on_filesystem_updated_at"
    t.string   "attachment_on_s3_file_name",            limit: 255
    t.string   "attachment_on_s3_content_type",         limit: 255
    t.integer  "attachment_on_s3_file_size",            limit: 8
    t.datetime "attachment_on_s3_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "unpacking_progress",                    limit: 4
    t.string   "unpacking_error_message",               limit: 255
    t.string   "index_document",                        limit: 255
    t.string   "thumbnail_file_name",                   limit: 255
    t.string   "thumbnail_content_type",                limit: 255
    t.integer  "thumbnail_file_size",                   limit: 4
    t.datetime "thumbnail_updated_at"
  end

  add_index "pageflow_panorama_packages", ["entry_id"], name: "index_pageflow_panorama_packages_on_entry_id", using: :btree
  add_index "pageflow_panorama_packages", ["uploader_id"], name: "index_pageflow_panorama_packages_on_uploader_id", using: :btree

  create_table "pageflow_revisions", force: :cascade do |t|
    t.integer  "entry_id",                    limit: 4
    t.integer  "creator_id",                  limit: 4
    t.datetime "published_at"
    t.datetime "published_until"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "credits",                     limit: 65535
    t.string   "title",                       limit: 255,   default: "",    null: false
    t.text     "summary",                     limit: 65535
    t.boolean  "manual_start",                              default: false
    t.integer  "restored_from_id",            limit: 4
    t.datetime "frozen_at"
    t.string   "snapshot_type",               limit: 255
    t.string   "home_url",                    limit: 255,   default: "",    null: false
    t.boolean  "home_button_enabled",                       default: false, null: false
    t.boolean  "emphasize_chapter_beginning",               default: false, null: false
    t.boolean  "emphasize_new_pages",                       default: false, null: false
    t.integer  "share_image_id",              limit: 4
    t.integer  "share_image_x",               limit: 4
    t.integer  "share_image_y",               limit: 4
    t.string   "locale",                      limit: 255
    t.boolean  "password_protected"
    t.string   "author",                      limit: 255
    t.string   "publisher",                   limit: 255
    t.string   "keywords",                    limit: 255
    t.boolean  "overview_button_enabled",                   default: true,  null: false
    t.string   "share_url",                   limit: 255,   default: "",    null: false
  end

  add_index "pageflow_revisions", ["entry_id", "published_at", "published_until"], name: "index_pageflow_revisions_on_publication_timestamps", using: :btree
  add_index "pageflow_revisions", ["restored_from_id"], name: "index_pageflow_revisions_on_restored_from_id", using: :btree

  create_table "pageflow_storylines", force: :cascade do |t|
    t.integer  "perma_id",      limit: 4
    t.integer  "revision_id",   limit: 4
    t.integer  "position",      limit: 4
    t.text     "configuration", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pageflow_storylines", ["revision_id"], name: "index_pageflow_storylines_on_revision_id", using: :btree

  create_table "pageflow_themings", force: :cascade do |t|
    t.string   "imprint_link_url",               limit: 255
    t.string   "imprint_link_label",             limit: 255
    t.string   "copyright_link_url",             limit: 255
    t.string   "copyright_link_label",           limit: 255
    t.integer  "account_id",                     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cname",                          limit: 255,  default: "",   null: false
    t.string   "theme_name",                     limit: 255
    t.string   "home_url",                       limit: 255,  default: "",   null: false
    t.boolean  "home_button_enabled_by_default",              default: true, null: false
    t.string   "additional_cnames",              limit: 255
    t.string   "default_author",                 limit: 255
    t.string   "default_publisher",              limit: 255
    t.string   "default_keywords",               limit: 255
    t.string   "avatar",                         limit: 1000
  end

  add_index "pageflow_themings", ["cname"], name: "index_pageflow_themings_on_cname", using: :btree

  create_table "pageflow_video_files", force: :cascade do |t|
    t.integer  "entry_id",                              limit: 4
    t.integer  "uploader_id",                           limit: 4
    t.string   "attachment_on_filesystem_file_name",    limit: 255
    t.string   "attachment_on_filesystem_content_type", limit: 255
    t.integer  "attachment_on_filesystem_file_size",    limit: 8
    t.datetime "attachment_on_filesystem_updated_at"
    t.string   "attachment_on_s3_file_name",            limit: 255
    t.string   "attachment_on_s3_content_type",         limit: 255
    t.integer  "attachment_on_s3_file_size",            limit: 8
    t.datetime "attachment_on_s3_updated_at"
    t.integer  "job_id",                                limit: 4
    t.string   "state",                                 limit: 255
    t.decimal  "encoding_progress",                                 precision: 5, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encoding_error_message",                limit: 255
    t.string   "thumbnail_file_name",                   limit: 255
    t.integer  "width",                                 limit: 4
    t.integer  "height",                                limit: 4
    t.integer  "duration_in_ms",                        limit: 4
    t.string   "format",                                limit: 255
    t.string   "poster_file_name",                      limit: 255
    t.string   "poster_content_type",                   limit: 255
    t.string   "thumbnail_content_type",                limit: 255
    t.string   "rights",                                limit: 255,                         default: "", null: false
    t.integer  "confirmed_by_id",                       limit: 4
  end

  create_table "pageflow_widgets", force: :cascade do |t|
    t.integer  "subject_id",   limit: 4
    t.string   "subject_type", limit: 255
    t.string   "type_name",    limit: 255
    t.string   "role",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",       null: false
    t.string   "encrypted_password",     limit: 255, default: "",       null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.integer  "failed_attempts",        limit: 4,   default: 0
    t.datetime "locked_at"
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.datetime "suspended_at"
    t.integer  "account_id",             limit: 4
    t.string   "role",                   limit: 255, default: "editor", null: false
    t.string   "locale",                 limit: 255
  end

  add_index "users", ["account_id"], name: "index_pageflow_users_on_account_id", using: :btree
  add_index "users", ["email"], name: "index_pageflow_users_on_email", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
