require "huxley/version"
require "fileutils"
require "thor"

module Huxley
  class Generator < Thor
    map ['-v', '--version'] => :version

    desc 'install', 'Install Huxley into your project'
    method_options path: :string, force: :boolean
    def install
      if huxley_files_already_exist? and !options[:force]
        puts "Huxley files already installed. No action taken."
      else
        install_files
        puts "Huxley files installed to #{install_path}/"
      end
    end

    desc 'update', 'Update Huxley'
    method_options path: :string
    def update
      if huxley_files_already_exist?
        remove_huxley_directory
        install_files
        puts "Huxley files updated."
      else
        puts "No existing Huxley installation. No action taken."
      end
    end

    desc 'remove', 'Remove Huxley from your project'
    method_options path: :string
    def remove
      if huxley_files_already_exist?
        remove_huxley_directory
        puts "Huxley was successfully removed."
      else
        puts "No existing huxley installation. No action taken."
      end
    end

    private

    def install_path
      @install_path ||= if options[:path]
        Pathname.new(File.join(options[:path], 'huxley'))
      else
        Pathname.new('huxley')
      end
    end

    def huxley_files_already_exist?
      install_path.exist?
    end

    def remove_huxley_directory
      FileUtils.rm_rf(install_path)
    end

    def install_files
      FileUtils.mkdir_p(install_path)
      FileUtils.cp_r(all_stylesheets, install_path)
    end

    def all_stylesheets
      Dir["#{stylesheets_directory}/*"]
    end

    def stylesheets_directory
      File.join(top_level_directory, "app", "assets", "stylesheets")
    end

    def top_level_directory
      File.dirname(File.dirname(File.dirname(__FILE__)))
    end
  end
end