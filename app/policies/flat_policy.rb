class FlatPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
      # This is the same as Flat.all
    end
  end

  def index?
    return true
  end

  def show?
    return true
  end

  # Because new/create same, new equal to ceate.
  def new?
    return create?
  end

  def create?
    return true
  end

  def edit?
    return update?
  end

  def update?
    # if creator = current user then can update/edit and delete
    # record = flat instance
    # user = current user
    return record.user_id == user.id # this will return true if condition met.
  end

  def destroy?
    return record.user_id == user.id # this will return true if condition met.
  end
end
