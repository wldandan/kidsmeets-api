$LOAD_PATH << File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))

ENV['RACK_ENV'] ||= 'development'

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
if File.exists?(ENV['BUNDLE_GEMFILE'])
  require 'bundler/setup'
  Bundler.require
end


module KidsMeets
  class App
    def self.logger
      @logger ||= ::Logger.new(File.join(root_path, 'log', "#{ENV['RACK_ENV']}.log"))
    end

    def self.logger=(logger)
      @logger = logger
    end

    def self.root_path
      @root_path ||= Pathname.new(File.join(File.dirname(__FILE__), '..')).realpath
    end
  end
end