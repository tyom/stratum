###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:

# With no layout
# page "/path/to/file.html", :layout => false

# With alternative layout
page "/*", :layout => "base"

# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Navigation
require 'map'
helpers do
  def nav(*args)
    if args.empty?
      @nav || data.nav.map{|hash| Map.for(hash)}
    else
      @nav = args.flatten.compact.map{|hash| Map.for(hash)}
    end
  end
end


set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

configure :development do
  activate :livereload
end

# Build-specific configuration
configure :build do
  ignore 'base.haml'

  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end


# Site deployment
activate :deploy do |deploy|
  deploy.method = :rsync
  deploy.user = "username"
  deploy.host = "website.com"
  deploy.path = "full/path/to/directory"
end
