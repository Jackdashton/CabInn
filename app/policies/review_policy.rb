class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def new?
    return create?
  end

  def create?
    return true
  end

  # def destroy?
  #   return record.user_id == user.id # this will return true if condition met.
  # end
end
