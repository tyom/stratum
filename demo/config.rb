###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page "*/partials/*", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
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
# activate :automatic_image_sizes

helpers do
  def pages_for_section(section_name)
    section = data.nav.find do |s|
      s.name == section_name
    end

    pages = []

    return pages unless section

    if section.directory
      pages << sitemap.resources.select { |r|
        r.path.include?(section.directory + "/") && !r.data.hidden && !r.path.include?(section.directory + "/index.html")
      }.map do |r|
        ::Middleman::Util.recursively_enhance({
          :name   => r.data.menu_label || r.data.title,
          :path   => r.url,
          :order  => r.data.menu_order
        })
      end.sort_by { |p| p.order.to_s || p.path }
    end

    pages << section.pages if section.pages
    pages.flatten
  end
end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

set :relative_links, true

# Sass options
::Compass.configuration.sass_options = {
  :load_paths => ['../assets/stylesheets/']
}

# Build-specific configuration
configure :build do
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

  ::Compass.configuration.sass_options[:line_comments] = false
end


configure :development do
  activate :livereload

  # ::Compass.configuration.sass_options[:debug_info] = true
  # ::Compass.configuration.sass_options[:line_comments] = false
end


activate :deploy do |deploy|
  deploy.method = :git

  # deploy.method = :rsync
  # deploy.user = "tyom"
  # deploy.host = "example.com"
  # deploy.path = "/path/to/www"
end
