module Spree
  module Alchemy
    class Ability
      include CanCan::Ability

      def initialize(user)
        if user && user.admin?
          can :admin_rules
        end
      end

    end
  end
end
