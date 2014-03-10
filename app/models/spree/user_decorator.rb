Spree::User.class_eval do

  def alchemy_roles
    if admin?
      ::Spree::Role.where(name: 'admin')
    else
      ::Spree::Role.where('1 = 0') # aka. empty relation
    end
  end

end
