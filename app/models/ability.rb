# frozen_string_literal: true

class Ability
    include CanCan::Ability
  
    def initialize(user)
      # Define abilities for the passed in user here. For example:
      #
      user ||= User.new # guest user (not logged in)
      if user.saga_admin?
        can :manage, :all
      end
  
      #can :manage, :all
  
      if user.company_user?
           #can :read, :balance_sheets
           
           if user.company and user.current_role.label != "consulting"
              if user.company.parent_id
                
                      #matriz ou filial com empresas pais
                       can :manage, [
                           :balance_sheets,
                           :cost_centers,
                           :budgets,
                           :front_dashboard_formulas,
                           :charts,
                           :balance_sheet
                       ]
              else
                  if user.company.group_type?
                      #grupo
                      can :manage, :all
                      cannot :manage, [
                           :balance_sheets,
                           :budgets,
                           :cost_centers,
                           :charts
                       ]
                       can :read, [
                         :balance_sheets
                       ]
                       
                  else
                      #matriz ou filial sem empresas pais
                      can :manage, :all
                  end
              end
             
           else
                   can :manage, [
                       :balance_sheets,
                       :cost_centers,
                       :charts,
                       :front_dashboard_formulas,
                       :indicators,
                       :contabil_patterns
                   ]
           end
  
           if user.current_role and user.current_role.label == "consulting"
              
               cannot :read, :all
               can :manage, [
                  :consulting
               ]
           end
         
      end
      #
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
      # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    end
  end
  