class Ability
  include CanCan::Ability

  def initialize(user)

    can :read, Project
  end
end
