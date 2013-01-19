require_relative 'version.rb'
require 'pathname'
require 'fileutils'
require 'thor'
require 'pry'

module Bedrock
	class Generator < Thor
		map ['-v', '--version'] => :version

		desc 'install', 'Install Bedrock into current directory'
		method_options :path => :string
		def install
			copy_files
			puts "Bedrock installed to #{install_path}"
		end

		desc 'version', 'Show Bedrock version'
		def version
			say "Bedrock #{Bedrock::VERSION}"
		end

		private

		def install_path
			@install_path ||= if options[:path]
				Pathname.new(File.join(options[:path], 'bedrock'))
			else
				Pathname.new('bedrock')
			end
		end

		def copy_files
			FileUtils.mkdir_p(install_path)
			FileUtils.cp_r(bedrock_stylesheets, install_path)
		end

		def bedrock_stylesheets
			current_dir = File.dirname(File.dirname(__FILE__))
			stylesheets = File.join(current_dir, "assets", "stylesheets")

			Dir["#{stylesheets}/*"]
		end
	end
end
