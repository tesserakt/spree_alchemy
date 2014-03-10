require 'spree/alchemy/ability'
require 'spree/alchemy/alchemy_language_store'
require 'spree'

module Spree
  module Alchemy
    class Engine < ::Rails::Engine
      engine_name 'spree_alchemy'

      initializer 'alchemy.user_class', after: 'spree_auth_devise.check_secret_token' do
        require File.join(File.dirname(__FILE__), './authentication_helpers')
      end

      def self.activate
        Dir.glob(File.join(File.dirname(__FILE__), "../../../app/**/*_decorator*.rb")) do |c|
          Rails.configuration.cache_classes ? require(c) : load(c)
        end
        ::Alchemy.register_ability(Spree::Alchemy::Ability)
      end

      config.to_prepare &method(:activate).to_proc
    end
  end
end
