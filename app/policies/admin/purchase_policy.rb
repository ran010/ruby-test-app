class Admin::PurchasePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    is_employee_admin
  end

  def show?
    is_employee_admin
  end

  def new?
    is_employee_admin
  end

  def create?
    is_employee_admin
  end

  def edit?
    is_employee_admin
  end

  def update?
    is_employee_admin
  end

  def destroy?
    is_employee_admin
  end

  def change_status?
    is_employee_admin
  end

  private
  def is_employee_admin
    @employee.admin?
  end
end
