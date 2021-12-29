class PurchasePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    @employee.admin? || @employee.agent? || @employee.manager?
  end

  def show?
    @employee.admin?
  end

  def new?
    @employee.admin?
  end

  def create?
    new?
  end

  def edit?
    @employee.admin? || @employee.manager?
  end

  def update?
    edit?
  end

  def destroy?
    @employee.admin? || @employee.manager?
  end

  def permitted_attributes
    if @employee.manager?
      [:status, :notes]
    else
      [:status]
    end
  end
end
