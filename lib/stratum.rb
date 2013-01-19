require_relative 'version.rb'
require 'pathname'
require 'fileutils'
require 'thor'
require 'pry'

module Stratum
	class Generator < Thor
		map ['-v', '--version'] => :version

		desc 'install', 'Install Stratum into current directory'
		method_options :path => :string
		def install
			copy_files
			puts "Stratum installed to #{install_path}"
		end

		desc 'version', 'Show Stratum version'
		def version
			say "Stratum #{Stratum::VERSION}"
		end

		private

		def install_path
			@install_path ||= if options[:path]
				Pathname.new(File.join(options[:path], 'stratum'))
			else
				Pathname.new('stratum')
			end
		end

		def copy_files
			FileUtils.mkdir_p(install_path)
			FileUtils.cp_r(stratum_stylesheets, install_path)
		end

		def stratum_stylesheets
			current_dir = File.dirname(File.dirname(__FILE__))
			stylesheets = File.join(current_dir, "assets", "stylesheets")

			Dir["#{stylesheets}/*"]
		end
	end
end
