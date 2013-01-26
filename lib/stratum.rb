require_relative 'version.rb'
require 'pathname'
require 'fileutils'
require 'thor'

module Stratum
	class Generator < Thor
		map ['-v', '--version'] => :version

		desc 'install', 'Install Stratum (./stratum); `stratum help install` for options'
		option :path, :type => :string, :aliases => '-p', :banner => './', :desc => 'Installation path'
		option :force, :aliases => '-f', :type => :boolean, :desc => 'Force installation (overwrite existing)'
		def install
			if install_path.exist? && !options[:force]
				puts "Stratum installation already exists. Use -f to force"
			else
				copy_files
				puts "Stratum installed to #{install_path}"
			end
		end

		desc 'update', 'Update Stratum'
		def update
			remove(true)
		end

		desc 'remove', 'Remove Stratum'
		def remove(replace = false)
			if stratum_exists?
				FileUtils.rm_rf("stratum")
				if replace
					copy_files
					puts "Stratum updated"
				else
					puts "Stratum has been removed"
				end
			else
				puts "Stratum installation is not found in current directory"
			end
		end

		desc 'version', 'Show Stratum version'
		def version
			say "Stratum #{Stratum::VERSION}"
		end

		private

		def stratum_exists?
			install_path.exist?
		end

		def install_path
			@install_path ||= if options[:path]
				Pathname.new(File.join(options[:path], 'stratum'))
			else
				Pathname.new('stratum')
			end
		end

		def copy_files
			FileUtils.mkdir_p(install_path)
			FileUtils.cp_r(assets_stylesheets, install_path)
		end

		def assets_stylesheets
			current_dir = File.dirname(File.dirname(__FILE__))
			stylesheets = File.join(current_dir, "assets", "stylesheets")

			Dir["#{stylesheets}/*"]
		end
	end
end
