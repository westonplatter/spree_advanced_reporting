require "ruport"
require 'wicked_pdf'

module Spree
  module AdvancedReporting
    class Engine < Rails::Engine
      engine_name "spree_advanced_reporting"

      config.autoload_paths += %W(#{config.root}/lib)

      def self.activate
        Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator.rb")).each do |c|
          Rails.env.production? ? require(c) : load(c)
        end
      end

      config.to_prepare &method(:activate).to_proc
    end
  end
end

