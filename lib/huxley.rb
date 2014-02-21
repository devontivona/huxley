dir = File.dirname(__FILE__)
$LOAD_PATH.unshift dir unless $LOAD_PATH.include?(dir)

require "bourbon"
require "huxley/generator"

unless defined?(Sass)
  require "sass"
end

module Huxley
  if defined?(Rails) and defined?(Rails::Engine)
    class Engine < ::Rails::Engine
      require "huxley/engine"
    end
  else
    Sass.load_paths << File.expand_path("../../app/assets/stylesheets", __FILE__)
  end
end