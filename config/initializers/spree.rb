# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'

Spree.config do |config|
  # Example:
  # Uncomment to stop tracking inventory levels in the application
  # config.track_inventory_levels = false
  #config.searcher_class = Spree::Search::Solr
end

Spree::PermittedAttributes.user_attributes << [:first_name, :last_name, :phone, :gender]
Spree.user_class = "Spree::User"


attachment_config = {

  s3_credentials: {
    access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    bucket:            ENV['S3_BUCKET_NAME']
  },

  storage:        :s3,
  #s3_headers:     { "Cache-Control" => "max-age=31557600" },
  s3_protocol:    "http",
  bucket:         ENV['S3_BUCKET_NAME'],
  #url:            ":s3_domain_url",

  styles: {
      mini:     "48x48>",
      small:    "100x100>",
      product:  "240x240>",
      large:    "600x600>"
  },

  #path:           "/printdora/:class/:id/:style/:basename.:extension",
  #default_url:    "/printdora/:class/:id/:style/:basename.:extension",
  default_style:  "product"
}

attachment_config.each do |key, value|
  Spree::Image.attachment_definitions[:attachment][key.to_sym] = value
end