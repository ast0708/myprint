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

ActiveRecord::Schema.define(version: 20150624071101) do

  create_table "Colors_Suites", id: false, force: true do |t|
    t.integer "color_id", null: false
    t.integer "suite_id", null: false
  end

  add_index "Colors_Suites", ["color_id", "suite_id"], name: "index_Colors_Suites_on_color_id_and_suite_id"
  add_index "Colors_Suites", ["suite_id", "color_id"], name: "index_Colors_Suites_on_suite_id_and_color_id"

  create_table "Dimensions_Suites", id: false, force: true do |t|
    t.integer "dimension_id", null: false
    t.integer "suite_id",     null: false
  end

  add_index "Dimensions_Suites", ["dimension_id", "suite_id"], name: "index_Dimensions_Suites_on_dimension_id_and_suite_id"
  add_index "Dimensions_Suites", ["suite_id", "dimension_id"], name: "index_Dimensions_Suites_on_suite_id_and_dimension_id"

  create_table "Papers_Suites", id: false, force: true do |t|
    t.integer "paper_id", null: false
    t.integer "suite_id", null: false
  end

  add_index "Papers_Suites", ["paper_id", "suite_id"], name: "index_Papers_Suites_on_paper_id_and_suite_id"
  add_index "Papers_Suites", ["suite_id", "paper_id"], name: "index_Papers_Suites_on_suite_id_and_paper_id"

  create_table "Suites_Trims", id: false, force: true do |t|
    t.integer "suite_id", null: false
    t.integer "trim_id",  null: false
  end

  add_index "Suites_Trims", ["suite_id", "trim_id"], name: "index_Suites_Trims_on_suite_id_and_trim_id"
  add_index "Suites_Trims", ["trim_id", "suite_id"], name: "index_Suites_Trims_on_trim_id_and_suite_id"

  create_table "banners", force: true do |t|
    t.string   "category"
    t.boolean  "enabled",              default: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "position"
  end

  create_table "blogit_comments", force: true do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.string   "website"
    t.text     "body",       null: false
    t.integer  "post_id",    null: false
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogit_comments", ["post_id"], name: "index_blogit_comments_on_post_id"

  create_table "blogit_posts", force: true do |t|
    t.string   "title",                            null: false
    t.text     "body",                             null: false
    t.string   "state",          default: "draft", null: false
    t.integer  "comments_count", default: 0,       null: false
    t.integer  "blogger_id"
    t.string   "blogger_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogit_posts", ["blogger_type", "blogger_id"], name: "index_blogit_posts_on_blogger_type_and_blogger_id"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "ancestry"
  end

  add_index "categories", ["ancestry"], name: "index_categories_on_ancestry"

  create_table "characteristics", force: true do |t|
    t.string   "name"
    t.integer  "suite_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "color"
  end

  create_table "colors", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "commentable_id",   default: 0
    t.string   "commentable_type"
    t.string   "title"
    t.text     "body"
    t.string   "subject"
    t.integer  "user_id",          default: 0, null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "contests", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "active",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customizations", force: true do |t|
    t.string   "color"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "custs", force: true do |t|
    t.string   "gr_name"
    t.string   "gr_father_name"
    t.string   "gr_mother_name"
    t.text     "gr_address"
    t.string   "br_name"
    t.string   "br_father_name"
    t.string   "br_mother_name"
    t.text     "br_address"
    t.integer  "user_id"
    t.integer  "suite_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
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

  create_table "designerratings", force: true do |t|
    t.integer  "stars",       default: 0
    t.integer  "user_id"
    t.integer  "designer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "designerreviews", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.integer  "rating"
    t.text     "title"
    t.text     "review"
    t.boolean  "approved",        default: false
    t.integer  "user_id"
    t.string   "ip_address"
    t.string   "locale"
    t.boolean  "show_identifier", default: true
    t.integer  "designer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "designerreviews", ["designer_id"], name: "index_designerreviews_on_designer_id"

  create_table "designers", force: true do |t|
    t.string   "name"
    t.text     "about"
    t.boolean  "active"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",             default: 0, null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "skills"
    t.string   "experience"
    t.string   "college"
    t.string   "phonenum"
    t.string   "slug"
    t.integer  "avg_rating"
    t.integer  "reviews_count"
  end

  add_index "designers", ["slug"], name: "index_designers_on_slug", unique: true

  create_table "dimensions", force: true do |t|
    t.string   "name"
    t.float    "width"
    t.float    "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discoverfollows", force: true do |t|
    t.integer  "spree_user_id"
    t.integer  "discover_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discovers", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "discovers_products", force: true do |t|
    t.integer "discover_id"
    t.integer "spree_products_id"
  end

  add_index "discovers_products", ["discover_id"], name: "index_discovers_products_on_discover_id"
  add_index "discovers_products", ["spree_products_id"], name: "index_discovers_products_on_spree_products_id"

  create_table "entries", force: true do |t|
    t.integer  "user_id"
    t.integer  "contest_id"
    t.text     "description"
    t.text     "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entry_attachements", force: true do |t|
    t.integer  "entry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "title"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "leads", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "contact"
    t.string   "city"
    t.string   "gender"
    t.string   "product_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  create_table "leafs", force: true do |t|
    t.text     "venue"
    t.date     "date_of_event"
    t.time     "time_of_event"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "likes", force: true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "likes", ["product_id"], name: "index_likes_on_product_id"
  add_index "likes", ["user_id", "product_id"], name: "index_likes_on_user_id_and_product_id", unique: true
  add_index "likes", ["user_id"], name: "index_likes_on_user_id"

  create_table "monologue_posts", force: true do |t|
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.string   "url"
    t.datetime "published_at"
  end

  add_index "monologue_posts", ["url"], name: "index_monologue_posts_on_url", unique: true

  create_table "monologue_taggings", force: true do |t|
    t.integer "post_id"
    t.integer "tag_id"
  end

  add_index "monologue_taggings", ["post_id"], name: "index_monologue_taggings_on_post_id"
  add_index "monologue_taggings", ["tag_id"], name: "index_monologue_taggings_on_tag_id"

  create_table "monologue_tags", force: true do |t|
    t.string "name"
  end

  add_index "monologue_tags", ["name"], name: "index_monologue_tags_on_name"

  create_table "monologue_users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "papers", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pogos", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "position"
    t.string   "category"
  end

  add_index "pogos", ["category", "position"], name: "index_pogos_on_category_and_position", unique: true

  create_table "prodinfos", force: true do |t|
    t.float    "length"
    t.float    "width"
    t.float    "height"
    t.string   "size"
    t.string   "material"
    t.string   "instructions"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_discovers", force: true do |t|
    t.integer  "discover_id",      default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "spree_product_id"
  end

  add_index "product_discovers", ["discover_id"], name: "index_product_discovers_on_discover_id"

  create_table "ratings", force: true do |t|
    t.integer  "stars",       default: 0
    t.integer  "product_id"
    t.integer  "user_id"
    t.integer  "designer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "similarprods", force: true do |t|
    t.string   "product_name"
    t.integer  "product_id"
    t.integer  "prod1"
    t.integer  "prod2"
    t.integer  "prod3"
    t.integer  "prod4"
    t.integer  "prod5"
    t.integer  "prod6"
    t.integer  "prod7"
    t.integer  "prod8"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_addresses", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "zipcode"
    t.string   "phone"
    t.string   "state_name"
    t.string   "alternative_phone"
    t.string   "company"
    t.integer  "state_id"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_addresses", ["country_id"], name: "index_spree_addresses_on_country_id"
  add_index "spree_addresses", ["firstname"], name: "index_addresses_on_firstname"
  add_index "spree_addresses", ["lastname"], name: "index_addresses_on_lastname"
  add_index "spree_addresses", ["state_id"], name: "index_spree_addresses_on_state_id"

  create_table "spree_adjustments", force: true do |t|
    t.integer  "source_id"
    t.string   "source_type"
    t.integer  "adjustable_id"
    t.string   "adjustable_type"
    t.decimal  "amount",          precision: 10, scale: 2
    t.string   "label"
    t.boolean  "mandatory"
    t.boolean  "eligible",                                 default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
    t.integer  "order_id"
    t.boolean  "included",                                 default: false
  end

  add_index "spree_adjustments", ["adjustable_id", "adjustable_type"], name: "index_spree_adjustments_on_adjustable_id_and_adjustable_type"
  add_index "spree_adjustments", ["adjustable_id"], name: "index_adjustments_on_order_id"
  add_index "spree_adjustments", ["eligible"], name: "index_spree_adjustments_on_eligible"
  add_index "spree_adjustments", ["order_id"], name: "index_spree_adjustments_on_order_id"
  add_index "spree_adjustments", ["source_id", "source_type"], name: "index_spree_adjustments_on_source_id_and_source_type"

  create_table "spree_assets", force: true do |t|
    t.integer  "viewable_id"
    t.string   "viewable_type"
    t.integer  "attachment_width"
    t.integer  "attachment_height"
    t.integer  "attachment_file_size"
    t.integer  "position"
    t.string   "attachment_content_type"
    t.string   "attachment_file_name"
    t.string   "type",                    limit: 75
    t.datetime "attachment_updated_at"
    t.text     "alt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_assets", ["viewable_id"], name: "index_assets_on_viewable_id"
  add_index "spree_assets", ["viewable_type", "type"], name: "index_assets_on_viewable_type_and_type"

  create_table "spree_authentication_methods", force: true do |t|
    t.string   "environment"
    t.string   "provider"
    t.string   "api_key"
    t.string   "api_secret"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_calculators", force: true do |t|
    t.string   "type"
    t.integer  "calculable_id"
    t.string   "calculable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "preferences"
  end

  add_index "spree_calculators", ["calculable_id", "calculable_type"], name: "index_spree_calculators_on_calculable_id_and_calculable_type"
  add_index "spree_calculators", ["id", "type"], name: "index_spree_calculators_on_id_and_type"

  create_table "spree_chimpy_order_sources", force: true do |t|
    t.integer  "order_id"
    t.string   "campaign_id"
    t.string   "email_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_chimpy_subscribers", force: true do |t|
    t.string   "email",                     null: false
    t.boolean  "subscribed", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_configurations", force: true do |t|
    t.string   "name"
    t.string   "type",       limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_configurations", ["name", "type"], name: "index_spree_configurations_on_name_and_type"

  create_table "spree_countries", force: true do |t|
    t.string   "iso_name"
    t.string   "iso"
    t.string   "iso3"
    t.string   "name"
    t.integer  "numcode"
    t.boolean  "states_required", default: false
    t.datetime "updated_at"
  end

  create_table "spree_credit_cards", force: true do |t|
    t.string   "month"
    t.string   "year"
    t.string   "cc_type"
    t.string   "last_digits"
    t.integer  "address_id"
    t.string   "gateway_customer_profile_id"
    t.string   "gateway_payment_profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "user_id"
    t.integer  "payment_method_id"
    t.boolean  "default",                     default: false, null: false
  end

  add_index "spree_credit_cards", ["address_id"], name: "index_spree_credit_cards_on_address_id"
  add_index "spree_credit_cards", ["payment_method_id"], name: "index_spree_credit_cards_on_payment_method_id"
  add_index "spree_credit_cards", ["user_id"], name: "index_spree_credit_cards_on_user_id"

  create_table "spree_customer_returns", force: true do |t|
    t.string   "number"
    t.integer  "stock_location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_feedback_reviews", force: true do |t|
    t.integer  "user_id"
    t.integer  "review_id",                 null: false
    t.integer  "rating",     default: 0
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "locale",     default: "en"
  end

  add_index "spree_feedback_reviews", ["review_id"], name: "index_spree_feedback_reviews_on_review_id"
  add_index "spree_feedback_reviews", ["user_id"], name: "index_spree_feedback_reviews_on_user_id"

  create_table "spree_gateways", force: true do |t|
    t.string   "type"
    t.string   "name"
    t.text     "description"
    t.boolean  "active",      default: true
    t.string   "environment", default: "development"
    t.string   "server",      default: "test"
    t.boolean  "test_mode",   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "preferences"
  end

  add_index "spree_gateways", ["active"], name: "index_spree_gateways_on_active"
  add_index "spree_gateways", ["test_mode"], name: "index_spree_gateways_on_test_mode"

  create_table "spree_inventory_units", force: true do |t|
    t.string   "state"
    t.integer  "variant_id"
    t.integer  "order_id"
    t.integer  "shipment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "pending",      default: true
    t.integer  "line_item_id"
  end

  add_index "spree_inventory_units", ["line_item_id"], name: "index_spree_inventory_units_on_line_item_id"
  add_index "spree_inventory_units", ["order_id"], name: "index_inventory_units_on_order_id"
  add_index "spree_inventory_units", ["shipment_id"], name: "index_inventory_units_on_shipment_id"
  add_index "spree_inventory_units", ["variant_id"], name: "index_inventory_units_on_variant_id"

  create_table "spree_line_items", force: true do |t|
    t.integer  "variant_id"
    t.integer  "order_id"
    t.integer  "quantity",                                                    null: false
    t.decimal  "price",                precision: 10, scale: 2,               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "currency"
    t.decimal  "cost_price",           precision: 10, scale: 2
    t.integer  "tax_category_id"
    t.decimal  "adjustment_total",     precision: 10, scale: 2, default: 0.0
    t.decimal  "additional_tax_total", precision: 10, scale: 2, default: 0.0
    t.decimal  "promo_total",          precision: 10, scale: 2, default: 0.0
    t.decimal  "included_tax_total",   precision: 10, scale: 2, default: 0.0, null: false
    t.decimal  "pre_tax_amount",       precision: 8,  scale: 2, default: 0.0
  end

  add_index "spree_line_items", ["order_id"], name: "index_spree_line_items_on_order_id"
  add_index "spree_line_items", ["tax_category_id"], name: "index_spree_line_items_on_tax_category_id"
  add_index "spree_line_items", ["variant_id"], name: "index_spree_line_items_on_variant_id"

  create_table "spree_log_entries", force: true do |t|
    t.integer  "source_id"
    t.string   "source_type"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_log_entries", ["source_id", "source_type"], name: "index_spree_log_entries_on_source_id_and_source_type"

  create_table "spree_option_types", force: true do |t|
    t.string   "name",         limit: 100
    t.string   "presentation", limit: 100
    t.integer  "position",                 default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_option_types", ["position"], name: "index_spree_option_types_on_position"

  create_table "spree_option_types_prototypes", id: false, force: true do |t|
    t.integer "prototype_id"
    t.integer "option_type_id"
  end

  create_table "spree_option_values", force: true do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "presentation"
    t.integer  "option_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_option_values", ["option_type_id"], name: "index_spree_option_values_on_option_type_id"
  add_index "spree_option_values", ["position"], name: "index_spree_option_values_on_position"

  create_table "spree_option_values_variants", id: false, force: true do |t|
    t.integer "variant_id"
    t.integer "option_value_id"
  end

  add_index "spree_option_values_variants", ["variant_id", "option_value_id"], name: "index_option_values_variants_on_variant_id_and_option_value_id"
  add_index "spree_option_values_variants", ["variant_id"], name: "index_spree_option_values_variants_on_variant_id"

  create_table "spree_orders", force: true do |t|
    t.string   "number",                 limit: 32
    t.decimal  "item_total",                        precision: 10, scale: 2, default: 0.0,     null: false
    t.decimal  "total",                             precision: 10, scale: 2, default: 0.0,     null: false
    t.string   "state"
    t.decimal  "adjustment_total",                  precision: 10, scale: 2, default: 0.0,     null: false
    t.integer  "user_id"
    t.datetime "completed_at"
    t.integer  "bill_address_id"
    t.integer  "ship_address_id"
    t.decimal  "payment_total",                     precision: 10, scale: 2, default: 0.0
    t.integer  "shipping_method_id"
    t.string   "shipment_state"
    t.string   "payment_state"
    t.string   "email"
    t.text     "special_instructions"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "currency"
    t.string   "last_ip_address"
    t.integer  "created_by_id"
    t.decimal  "shipment_total",                    precision: 10, scale: 2, default: 0.0,     null: false
    t.decimal  "additional_tax_total",              precision: 10, scale: 2, default: 0.0
    t.decimal  "promo_total",                       precision: 10, scale: 2, default: 0.0
    t.string   "channel",                                                    default: "spree"
    t.decimal  "included_tax_total",                precision: 10, scale: 2, default: 0.0,     null: false
    t.integer  "item_count",                                                 default: 0
    t.integer  "approver_id"
    t.datetime "approved_at"
    t.boolean  "confirmation_delivered",                                     default: false
    t.boolean  "considered_risky",                                           default: false
    t.string   "guest_token"
    t.datetime "canceled_at"
    t.integer  "canceler_id"
    t.integer  "store_id"
    t.integer  "state_lock_version",                                         default: 0,       null: false
  end

  add_index "spree_orders", ["approver_id"], name: "index_spree_orders_on_approver_id"
  add_index "spree_orders", ["bill_address_id"], name: "index_spree_orders_on_bill_address_id"
  add_index "spree_orders", ["completed_at"], name: "index_spree_orders_on_completed_at"
  add_index "spree_orders", ["confirmation_delivered"], name: "index_spree_orders_on_confirmation_delivered"
  add_index "spree_orders", ["considered_risky"], name: "index_spree_orders_on_considered_risky"
  add_index "spree_orders", ["created_by_id"], name: "index_spree_orders_on_created_by_id"
  add_index "spree_orders", ["guest_token"], name: "index_spree_orders_on_guest_token"
  add_index "spree_orders", ["number"], name: "index_spree_orders_on_number"
  add_index "spree_orders", ["ship_address_id"], name: "index_spree_orders_on_ship_address_id"
  add_index "spree_orders", ["shipping_method_id"], name: "index_spree_orders_on_shipping_method_id"
  add_index "spree_orders", ["user_id", "created_by_id"], name: "index_spree_orders_on_user_id_and_created_by_id"
  add_index "spree_orders", ["user_id"], name: "index_spree_orders_on_user_id"

  create_table "spree_orders_promotions", id: false, force: true do |t|
    t.integer "order_id"
    t.integer "promotion_id"
  end

  add_index "spree_orders_promotions", ["order_id", "promotion_id"], name: "index_spree_orders_promotions_on_order_id_and_promotion_id"

  create_table "spree_payment_capture_events", force: true do |t|
    t.decimal  "amount",     precision: 10, scale: 2, default: 0.0
    t.integer  "payment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_payment_capture_events", ["payment_id"], name: "index_spree_payment_capture_events_on_payment_id"

  create_table "spree_payment_methods", force: true do |t|
    t.string   "type"
    t.string   "name"
    t.text     "description"
    t.boolean  "active",       default: true
    t.string   "environment",  default: "development"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "display_on"
    t.boolean  "auto_capture"
    t.text     "preferences"
  end

  add_index "spree_payment_methods", ["id", "type"], name: "index_spree_payment_methods_on_id_and_type"

  create_table "spree_payments", force: true do |t|
    t.decimal  "amount",               precision: 10, scale: 2, default: 0.0, null: false
    t.integer  "order_id"
    t.integer  "source_id"
    t.string   "source_type"
    t.integer  "payment_method_id"
    t.string   "state"
    t.string   "response_code"
    t.string   "avs_response"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "number"
    t.string   "cvv_response_code"
    t.string   "cvv_response_message"
  end

  add_index "spree_payments", ["order_id"], name: "index_spree_payments_on_order_id"
  add_index "spree_payments", ["payment_method_id"], name: "index_spree_payments_on_payment_method_id"
  add_index "spree_payments", ["source_id", "source_type"], name: "index_spree_payments_on_source_id_and_source_type"

  create_table "spree_preferences", force: true do |t|
    t.text     "value"
    t.string   "key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_preferences", ["key"], name: "index_spree_preferences_on_key", unique: true

  create_table "spree_prices", force: true do |t|
    t.integer  "variant_id",                          null: false
    t.decimal  "amount",     precision: 10, scale: 2
    t.string   "currency"
    t.datetime "deleted_at"
  end

  add_index "spree_prices", ["deleted_at"], name: "index_spree_prices_on_deleted_at"
  add_index "spree_prices", ["variant_id", "currency"], name: "index_spree_prices_on_variant_id_and_currency"

  create_table "spree_product_option_types", force: true do |t|
    t.integer  "position"
    t.integer  "product_id"
    t.integer  "option_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_product_option_types", ["option_type_id"], name: "index_spree_product_option_types_on_option_type_id"
  add_index "spree_product_option_types", ["position"], name: "index_spree_product_option_types_on_position"
  add_index "spree_product_option_types", ["product_id"], name: "index_spree_product_option_types_on_product_id"

  create_table "spree_product_properties", force: true do |t|
    t.string   "value"
    t.integer  "product_id"
    t.integer  "property_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",    default: 0
  end

  add_index "spree_product_properties", ["position"], name: "index_spree_product_properties_on_position"
  add_index "spree_product_properties", ["product_id"], name: "index_product_properties_on_product_id"
  add_index "spree_product_properties", ["property_id"], name: "index_spree_product_properties_on_property_id"

  create_table "spree_products", force: true do |t|
    t.string   "name",                 default: "",    null: false
    t.text     "description"
    t.datetime "available_on"
    t.datetime "deleted_at"
    t.string   "slug"
    t.text     "meta_description"
    t.string   "meta_keywords"
    t.integer  "tax_category_id"
    t.integer  "shipping_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "promotionable",        default: true
    t.string   "meta_title"
    t.integer  "designer_id"
    t.integer  "avg_rating"
    t.integer  "discover_id"
    t.integer  "reviews_count"
    t.integer  "like_no",              default: 0
    t.text     "shipping"
    t.text     "overview"
    t.boolean  "cod",                  default: false
    t.integer  "delivery_time"
  end

  add_index "spree_products", ["available_on"], name: "index_spree_products_on_available_on"
  add_index "spree_products", ["deleted_at"], name: "index_spree_products_on_deleted_at"
  add_index "spree_products", ["name"], name: "index_spree_products_on_name"
  add_index "spree_products", ["shipping_category_id"], name: "index_spree_products_on_shipping_category_id"
  add_index "spree_products", ["slug"], name: "index_spree_products_on_slug", unique: true
  add_index "spree_products", ["tax_category_id"], name: "index_spree_products_on_tax_category_id"

  create_table "spree_products_promotion_rules", id: false, force: true do |t|
    t.integer "product_id"
    t.integer "promotion_rule_id"
  end

  add_index "spree_products_promotion_rules", ["product_id"], name: "index_products_promotion_rules_on_product_id"
  add_index "spree_products_promotion_rules", ["promotion_rule_id"], name: "index_products_promotion_rules_on_promotion_rule_id"

  create_table "spree_products_taxons", force: true do |t|
    t.integer "product_id"
    t.integer "taxon_id"
    t.integer "position"
  end

  add_index "spree_products_taxons", ["position"], name: "index_spree_products_taxons_on_position"
  add_index "spree_products_taxons", ["product_id"], name: "index_spree_products_taxons_on_product_id"
  add_index "spree_products_taxons", ["taxon_id"], name: "index_spree_products_taxons_on_taxon_id"

  create_table "spree_promotion_action_line_items", force: true do |t|
    t.integer "promotion_action_id"
    t.integer "variant_id"
    t.integer "quantity",            default: 1
  end

  add_index "spree_promotion_action_line_items", ["promotion_action_id"], name: "index_spree_promotion_action_line_items_on_promotion_action_id"
  add_index "spree_promotion_action_line_items", ["variant_id"], name: "index_spree_promotion_action_line_items_on_variant_id"

  create_table "spree_promotion_actions", force: true do |t|
    t.integer  "promotion_id"
    t.integer  "position"
    t.string   "type"
    t.datetime "deleted_at"
  end

  add_index "spree_promotion_actions", ["deleted_at"], name: "index_spree_promotion_actions_on_deleted_at"
  add_index "spree_promotion_actions", ["id", "type"], name: "index_spree_promotion_actions_on_id_and_type"
  add_index "spree_promotion_actions", ["promotion_id"], name: "index_spree_promotion_actions_on_promotion_id"

  create_table "spree_promotion_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_promotion_rules", force: true do |t|
    t.integer  "promotion_id"
    t.integer  "user_id"
    t.integer  "product_group_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
    t.text     "preferences"
  end

  add_index "spree_promotion_rules", ["product_group_id"], name: "index_promotion_rules_on_product_group_id"
  add_index "spree_promotion_rules", ["promotion_id"], name: "index_spree_promotion_rules_on_promotion_id"
  add_index "spree_promotion_rules", ["user_id"], name: "index_promotion_rules_on_user_id"

  create_table "spree_promotion_rules_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "promotion_rule_id"
  end

  add_index "spree_promotion_rules_users", ["promotion_rule_id"], name: "index_promotion_rules_users_on_promotion_rule_id"
  add_index "spree_promotion_rules_users", ["user_id"], name: "index_promotion_rules_users_on_user_id"

  create_table "spree_promotions", force: true do |t|
    t.string   "description"
    t.datetime "expires_at"
    t.datetime "starts_at"
    t.string   "name"
    t.string   "type"
    t.integer  "usage_limit"
    t.string   "match_policy",          default: "all"
    t.string   "code"
    t.boolean  "advertise",             default: false
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "promotion_category_id"
  end

  add_index "spree_promotions", ["advertise"], name: "index_spree_promotions_on_advertise"
  add_index "spree_promotions", ["code"], name: "index_spree_promotions_on_code"
  add_index "spree_promotions", ["expires_at"], name: "index_spree_promotions_on_expires_at"
  add_index "spree_promotions", ["id", "type"], name: "index_spree_promotions_on_id_and_type"
  add_index "spree_promotions", ["promotion_category_id"], name: "index_spree_promotions_on_promotion_category_id"
  add_index "spree_promotions", ["starts_at"], name: "index_spree_promotions_on_starts_at"

  create_table "spree_properties", force: true do |t|
    t.string   "name"
    t.string   "presentation", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_properties_prototypes", id: false, force: true do |t|
    t.integer "prototype_id"
    t.integer "property_id"
  end

  create_table "spree_prototypes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_refund_reasons", force: true do |t|
    t.string   "name"
    t.boolean  "active",     default: true
    t.boolean  "mutable",    default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_refunds", force: true do |t|
    t.integer  "payment_id"
    t.decimal  "amount",           precision: 10, scale: 2, default: 0.0, null: false
    t.string   "transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "refund_reason_id"
    t.integer  "reimbursement_id"
  end

  add_index "spree_refunds", ["refund_reason_id"], name: "index_refunds_on_refund_reason_id"

  create_table "spree_reimbursement_credits", force: true do |t|
    t.decimal "amount",           precision: 10, scale: 2, default: 0.0, null: false
    t.integer "reimbursement_id"
    t.integer "creditable_id"
    t.string  "creditable_type"
  end

  create_table "spree_reimbursement_types", force: true do |t|
    t.string   "name"
    t.boolean  "active",     default: true
    t.boolean  "mutable",    default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  add_index "spree_reimbursement_types", ["type"], name: "index_spree_reimbursement_types_on_type"

  create_table "spree_reimbursements", force: true do |t|
    t.string   "number"
    t.string   "reimbursement_status"
    t.integer  "customer_return_id"
    t.integer  "order_id"
    t.decimal  "total",                precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_reimbursements", ["customer_return_id"], name: "index_spree_reimbursements_on_customer_return_id"
  add_index "spree_reimbursements", ["order_id"], name: "index_spree_reimbursements_on_order_id"

  create_table "spree_return_authorization_reasons", force: true do |t|
    t.string   "name"
    t.boolean  "active",     default: true
    t.boolean  "mutable",    default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_return_authorizations", force: true do |t|
    t.string   "number"
    t.string   "state"
    t.integer  "order_id"
    t.text     "memo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "stock_location_id"
    t.integer  "return_authorization_reason_id"
  end

  add_index "spree_return_authorizations", ["return_authorization_reason_id"], name: "index_return_authorizations_on_return_authorization_reason_id"

  create_table "spree_return_items", force: true do |t|
    t.integer  "return_authorization_id"
    t.integer  "inventory_unit_id"
    t.integer  "exchange_variant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "pre_tax_amount",                  precision: 12, scale: 4, default: 0.0, null: false
    t.decimal  "included_tax_total",              precision: 12, scale: 4, default: 0.0, null: false
    t.decimal  "additional_tax_total",            precision: 12, scale: 4, default: 0.0, null: false
    t.string   "reception_status"
    t.string   "acceptance_status"
    t.integer  "customer_return_id"
    t.integer  "reimbursement_id"
    t.integer  "exchange_inventory_unit_id"
    t.text     "acceptance_status_errors"
    t.integer  "preferred_reimbursement_type_id"
    t.integer  "override_reimbursement_type_id"
  end

  add_index "spree_return_items", ["customer_return_id"], name: "index_return_items_on_customer_return_id"
  add_index "spree_return_items", ["exchange_inventory_unit_id"], name: "index_spree_return_items_on_exchange_inventory_unit_id"

  create_table "spree_reviews", force: true do |t|
    t.integer  "product_id"
    t.string   "name"
    t.string   "location"
    t.integer  "rating"
    t.text     "title"
    t.text     "review"
    t.boolean  "approved",        default: false
    t.integer  "user_id"
    t.string   "ip_address"
    t.string   "locale"
    t.boolean  "show_identifier", default: true
    t.integer  "designer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_reviews", ["designer_id"], name: "index_spree_reviews_on_designer_id"
  add_index "spree_reviews", ["product_id"], name: "index_spree_reviews_on_product_id"

  create_table "spree_roles", force: true do |t|
    t.string "name"
  end

  create_table "spree_roles_users", id: false, force: true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "spree_roles_users", ["role_id"], name: "index_spree_roles_users_on_role_id"
  add_index "spree_roles_users", ["user_id"], name: "index_spree_roles_users_on_user_id"

  create_table "spree_shipments", force: true do |t|
    t.string   "tracking"
    t.string   "number"
    t.decimal  "cost",                 precision: 10, scale: 2, default: 0.0
    t.datetime "shipped_at"
    t.integer  "order_id"
    t.integer  "address_id"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "stock_location_id"
    t.decimal  "adjustment_total",     precision: 10, scale: 2, default: 0.0
    t.decimal  "additional_tax_total", precision: 10, scale: 2, default: 0.0
    t.decimal  "promo_total",          precision: 10, scale: 2, default: 0.0
    t.decimal  "included_tax_total",   precision: 10, scale: 2, default: 0.0, null: false
    t.decimal  "pre_tax_amount",       precision: 8,  scale: 2, default: 0.0
  end

  add_index "spree_shipments", ["address_id"], name: "index_spree_shipments_on_address_id"
  add_index "spree_shipments", ["number"], name: "index_shipments_on_number"
  add_index "spree_shipments", ["order_id"], name: "index_spree_shipments_on_order_id"
  add_index "spree_shipments", ["stock_location_id"], name: "index_spree_shipments_on_stock_location_id"

  create_table "spree_shipping_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_shipping_method_categories", force: true do |t|
    t.integer  "shipping_method_id",   null: false
    t.integer  "shipping_category_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_shipping_method_categories", ["shipping_category_id", "shipping_method_id"], name: "unique_spree_shipping_method_categories", unique: true
  add_index "spree_shipping_method_categories", ["shipping_method_id"], name: "index_spree_shipping_method_categories_on_shipping_method_id"

  create_table "spree_shipping_methods", force: true do |t|
    t.string   "name"
    t.string   "display_on"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tracking_url"
    t.string   "admin_name"
    t.integer  "tax_category_id"
    t.string   "code"
  end

  add_index "spree_shipping_methods", ["deleted_at"], name: "index_spree_shipping_methods_on_deleted_at"
  add_index "spree_shipping_methods", ["tax_category_id"], name: "index_spree_shipping_methods_on_tax_category_id"

  create_table "spree_shipping_methods_zones", id: false, force: true do |t|
    t.integer "shipping_method_id"
    t.integer "zone_id"
  end

  create_table "spree_shipping_rates", force: true do |t|
    t.integer  "shipment_id"
    t.integer  "shipping_method_id"
    t.boolean  "selected",                                   default: false
    t.decimal  "cost",               precision: 8, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tax_rate_id"
  end

  add_index "spree_shipping_rates", ["selected"], name: "index_spree_shipping_rates_on_selected"
  add_index "spree_shipping_rates", ["shipment_id", "shipping_method_id"], name: "spree_shipping_rates_join_index", unique: true
  add_index "spree_shipping_rates", ["tax_rate_id"], name: "index_spree_shipping_rates_on_tax_rate_id"

  create_table "spree_skrill_transactions", force: true do |t|
    t.string   "email"
    t.float    "amount"
    t.string   "currency"
    t.integer  "transaction_id"
    t.integer  "customer_id"
    t.string   "payment_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_state_changes", force: true do |t|
    t.string   "name"
    t.string   "previous_state"
    t.integer  "stateful_id"
    t.integer  "user_id"
    t.string   "stateful_type"
    t.string   "next_state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_state_changes", ["stateful_id", "stateful_type"], name: "index_spree_state_changes_on_stateful_id_and_stateful_type"
  add_index "spree_state_changes", ["user_id"], name: "index_spree_state_changes_on_user_id"

  create_table "spree_states", force: true do |t|
    t.string   "name"
    t.string   "abbr"
    t.integer  "country_id"
    t.datetime "updated_at"
  end

  add_index "spree_states", ["country_id"], name: "index_spree_states_on_country_id"

  create_table "spree_stock_items", force: true do |t|
    t.integer  "stock_location_id"
    t.integer  "variant_id"
    t.integer  "count_on_hand",     default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "backorderable",     default: false
    t.datetime "deleted_at"
  end

  add_index "spree_stock_items", ["backorderable"], name: "index_spree_stock_items_on_backorderable"
  add_index "spree_stock_items", ["deleted_at"], name: "index_spree_stock_items_on_deleted_at"
  add_index "spree_stock_items", ["stock_location_id", "variant_id"], name: "stock_item_by_loc_and_var_id"
  add_index "spree_stock_items", ["stock_location_id"], name: "index_spree_stock_items_on_stock_location_id"

  create_table "spree_stock_locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "default",                default: false, null: false
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.integer  "state_id"
    t.string   "state_name"
    t.integer  "country_id"
    t.string   "zipcode"
    t.string   "phone"
    t.boolean  "active",                 default: true
    t.boolean  "backorderable_default",  default: false
    t.boolean  "propagate_all_variants", default: true
    t.string   "admin_name"
  end

  add_index "spree_stock_locations", ["active"], name: "index_spree_stock_locations_on_active"
  add_index "spree_stock_locations", ["backorderable_default"], name: "index_spree_stock_locations_on_backorderable_default"
  add_index "spree_stock_locations", ["country_id"], name: "index_spree_stock_locations_on_country_id"
  add_index "spree_stock_locations", ["propagate_all_variants"], name: "index_spree_stock_locations_on_propagate_all_variants"
  add_index "spree_stock_locations", ["state_id"], name: "index_spree_stock_locations_on_state_id"

  create_table "spree_stock_movements", force: true do |t|
    t.integer  "stock_item_id"
    t.integer  "quantity",        default: 0
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "originator_id"
    t.string   "originator_type"
  end

  add_index "spree_stock_movements", ["stock_item_id"], name: "index_spree_stock_movements_on_stock_item_id"

  create_table "spree_stock_transfers", force: true do |t|
    t.string   "type"
    t.string   "reference"
    t.integer  "source_location_id"
    t.integer  "destination_location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "number"
  end

  add_index "spree_stock_transfers", ["destination_location_id"], name: "index_spree_stock_transfers_on_destination_location_id"
  add_index "spree_stock_transfers", ["number"], name: "index_spree_stock_transfers_on_number"
  add_index "spree_stock_transfers", ["source_location_id"], name: "index_spree_stock_transfers_on_source_location_id"

  create_table "spree_stores", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "meta_description"
    t.text     "meta_keywords"
    t.string   "seo_title"
    t.string   "mail_from_address"
    t.string   "default_currency"
    t.string   "code"
    t.boolean  "default",           default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_stores", ["code"], name: "index_spree_stores_on_code"
  add_index "spree_stores", ["default"], name: "index_spree_stores_on_default"
  add_index "spree_stores", ["url"], name: "index_spree_stores_on_url"

  create_table "spree_tax_categories", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "is_default",  default: false
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tax_code"
  end

  add_index "spree_tax_categories", ["deleted_at"], name: "index_spree_tax_categories_on_deleted_at"
  add_index "spree_tax_categories", ["is_default"], name: "index_spree_tax_categories_on_is_default"

  create_table "spree_tax_rates", force: true do |t|
    t.decimal  "amount",             precision: 8, scale: 5
    t.integer  "zone_id"
    t.integer  "tax_category_id"
    t.boolean  "included_in_price",                          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "show_rate_in_label",                         default: true
    t.datetime "deleted_at"
  end

  add_index "spree_tax_rates", ["deleted_at"], name: "index_spree_tax_rates_on_deleted_at"
  add_index "spree_tax_rates", ["included_in_price"], name: "index_spree_tax_rates_on_included_in_price"
  add_index "spree_tax_rates", ["show_rate_in_label"], name: "index_spree_tax_rates_on_show_rate_in_label"
  add_index "spree_tax_rates", ["tax_category_id"], name: "index_spree_tax_rates_on_tax_category_id"
  add_index "spree_tax_rates", ["zone_id"], name: "index_spree_tax_rates_on_zone_id"

  create_table "spree_taxonomies", force: true do |t|
    t.string   "name",                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",   default: 0
  end

  add_index "spree_taxonomies", ["position"], name: "index_spree_taxonomies_on_position"

  create_table "spree_taxons", force: true do |t|
    t.integer  "parent_id"
    t.integer  "position",          default: 0
    t.string   "name",                          null: false
    t.string   "permalink"
    t.integer  "taxonomy_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "meta_title"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.integer  "depth"
  end

  add_index "spree_taxons", ["parent_id"], name: "index_taxons_on_parent_id"
  add_index "spree_taxons", ["permalink"], name: "index_taxons_on_permalink"
  add_index "spree_taxons", ["position"], name: "index_spree_taxons_on_position"
  add_index "spree_taxons", ["taxonomy_id"], name: "index_taxons_on_taxonomy_id"

  create_table "spree_taxons_promotion_rules", force: true do |t|
    t.integer "taxon_id"
    t.integer "promotion_rule_id"
  end

  add_index "spree_taxons_promotion_rules", ["promotion_rule_id"], name: "index_spree_taxons_promotion_rules_on_promotion_rule_id"
  add_index "spree_taxons_promotion_rules", ["taxon_id"], name: "index_spree_taxons_promotion_rules_on_taxon_id"

  create_table "spree_taxons_prototypes", force: true do |t|
    t.integer "taxon_id"
    t.integer "prototype_id"
  end

  add_index "spree_taxons_prototypes", ["prototype_id"], name: "index_spree_taxons_prototypes_on_prototype_id"
  add_index "spree_taxons_prototypes", ["taxon_id"], name: "index_spree_taxons_prototypes_on_taxon_id"

  create_table "spree_trackers", force: true do |t|
    t.string   "environment"
    t.string   "analytics_id"
    t.boolean  "active",       default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_trackers", ["active"], name: "index_spree_trackers_on_active"

  create_table "spree_user_authentications", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spree_users", force: true do |t|
    t.string   "encrypted_password",     limit: 128
    t.string   "password_salt",          limit: 128
    t.string   "email"
    t.string   "remember_token"
    t.string   "persistence_token"
    t.string   "reset_password_token"
    t.string   "perishable_token"
    t.integer  "sign_in_count",                      default: 0,     null: false
    t.integer  "failed_attempts",                    default: 0,     null: false
    t.datetime "last_request_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "login"
    t.integer  "ship_address_id"
    t.integer  "bill_address_id"
    t.string   "authentication_token"
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "spree_api_key",          limit: 48
    t.datetime "remember_created_at"
    t.datetime "deleted_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "first_name"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.boolean  "is_designer",                        default: false
    t.boolean  "subscribed"
    t.string   "last_name"
    t.string   "phone"
    t.string   "gender"
  end

  add_index "spree_users", ["deleted_at"], name: "index_spree_users_on_deleted_at"
  add_index "spree_users", ["email"], name: "email_idx_unique", unique: true
  add_index "spree_users", ["spree_api_key"], name: "index_spree_users_on_spree_api_key"
  add_index "spree_users", ["uid"], name: "index_spree_users_on_uid"

  create_table "spree_variants", force: true do |t|
    t.string   "sku",                                        default: "",    null: false
    t.decimal  "weight",            precision: 8,  scale: 2, default: 0.0
    t.decimal  "height",            precision: 8,  scale: 2
    t.decimal  "width",             precision: 8,  scale: 2
    t.decimal  "depth",             precision: 8,  scale: 2
    t.datetime "deleted_at"
    t.boolean  "is_master",                                  default: false
    t.integer  "product_id"
    t.decimal  "cost_price",        precision: 10, scale: 2
    t.integer  "position"
    t.string   "cost_currency"
    t.boolean  "track_inventory",                            default: true
    t.integer  "tax_category_id"
    t.datetime "updated_at"
    t.integer  "stock_items_count",                          default: 0,     null: false
  end

  add_index "spree_variants", ["deleted_at"], name: "index_spree_variants_on_deleted_at"
  add_index "spree_variants", ["is_master"], name: "index_spree_variants_on_is_master"
  add_index "spree_variants", ["position"], name: "index_spree_variants_on_position"
  add_index "spree_variants", ["product_id"], name: "index_spree_variants_on_product_id"
  add_index "spree_variants", ["sku"], name: "index_spree_variants_on_sku"
  add_index "spree_variants", ["tax_category_id"], name: "index_spree_variants_on_tax_category_id"
  add_index "spree_variants", ["track_inventory"], name: "index_spree_variants_on_track_inventory"

  create_table "spree_volume_prices", force: true do |t|
    t.integer  "variant_id"
    t.string   "name"
    t.string   "range"
    t.decimal  "amount",        precision: 8, scale: 2
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "discount_type"
  end

  create_table "spree_wished_products", force: true do |t|
    t.integer  "suite_id"
    t.integer  "wishlist_id"
    t.text     "remark"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "spree_wishlists", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "access_hash"
    t.boolean  "is_private",  default: true,  null: false
    t.boolean  "is_default",  default: false, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "spree_wishlists", ["user_id", "is_default"], name: "index_spree_wishlists_on_user_id_and_is_default"
  add_index "spree_wishlists", ["user_id"], name: "index_spree_wishlists_on_user_id"

  create_table "spree_zone_members", force: true do |t|
    t.integer  "zoneable_id"
    t.string   "zoneable_type"
    t.integer  "zone_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spree_zone_members", ["zone_id"], name: "index_spree_zone_members_on_zone_id"
  add_index "spree_zone_members", ["zoneable_id", "zoneable_type"], name: "index_spree_zone_members_on_zoneable_id_and_zoneable_type"

  create_table "spree_zones", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "default_tax",        default: false
    t.integer  "zone_members_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "kind"
  end

  add_index "spree_zones", ["default_tax"], name: "index_spree_zones_on_default_tax"
  add_index "spree_zones", ["kind"], name: "index_spree_zones_on_kind"

  create_table "stories", force: true do |t|
    t.integer  "actor_id"
    t.string   "actor_type"
    t.string   "verb"
    t.integer  "object_id"
    t.string   "object_type"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stories", ["actor_id"], name: "index_stories_on_actor_id"
  add_index "stories", ["object_id"], name: "index_stories_on_object_id"

  create_table "sub_categories", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "sub_categories", ["category_id"], name: "index_sub_categories_on_category_id"
  add_index "sub_categories", ["slug"], name: "index_sub_categories_on_slug"

  create_table "sub_categories_suites", id: false, force: true do |t|
    t.integer "sub_category_id", null: false
    t.integer "suite_id",        null: false
  end

  add_index "sub_categories_suites", ["sub_category_id", "suite_id"], name: "index_sub_categories_suites_on_sub_category_id_and_suite_id"
  add_index "sub_categories_suites", ["suite_id", "sub_category_id"], name: "index_sub_categories_suites_on_suite_id_and_sub_category_id"

  create_table "suite_images", force: true do |t|
    t.integer  "suite_id"
    t.string   "type"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "suites", force: true do |t|
    t.string   "sku_id"
    t.string   "name"
    t.text     "description"
    t.integer  "designer_id"
    t.integer  "sub_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "available_on"
    t.decimal  "avg_rating",          precision: 7, scale: 5, default: 0.0, null: false
    t.integer  "reviews_count",                               default: 0,   null: false
    t.integer  "like_no",                                     default: 0
    t.string   "slug"
    t.integer  "position"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "variant"
    t.string   "characteristic"
    t.integer  "price"
  end

  add_index "suites", ["available_on"], name: "index_suites_on_available_on"
  add_index "suites", ["designer_id"], name: "index_suites_on_designer_id"
  add_index "suites", ["position"], name: "index_suites_on_position"
  add_index "suites", ["slug"], name: "index_suites_on_slug"
  add_index "suites", ["sub_category_id"], name: "index_suites_on_sub_category_id"

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "trims", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
