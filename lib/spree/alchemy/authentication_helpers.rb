module Spree
  module Alchemy
    module AuthenticationHelpers
      def self.included(receiver)
        receiver.send :helper_method, :login_path
        receiver.send :helper_method, :signup_path
        receiver.send :helper_method, :logout_path
        receiver.send :helper_method, :current_user
        receiver.send :helper_method, :current_alchemy_user
      end

      def current_alchemy_user
        spree_current_user
      end

      def current_user
        spree_current_user
      end

      def login_path
        spree_login_path
      end

      def signup_path
        spree_signup_path
      end

      def logout_path
        spree_logout_path
      end
    end
  end
end

ApplicationController.send :include, Spree::Alchemy::AuthenticationHelpers