if defined? Spree::UserSessionsController
  Spree::UserSessionsController.class_eval do
    include SpreeAlchemy::AlchemyLanguageStore
  end
end
