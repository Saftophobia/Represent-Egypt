class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
       user ||= User.new # guest user (not logged in)
       if user.try(:admin)
          can :manage, :all
       else
          can :create, Entity
    
          can :show, Entity do |l|
            l.user_id == user.id || l.admin_verification == true
          end

          can :update, Entity, :user_id => user.id
          cannot :destroy, Entity


       end
    
    #alias_action :create, :read, :update, :destroy, :to => :crud

    #can :crud, User

    
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
