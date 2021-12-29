class EmployeePresenter
  include Rails.application.routes.url_helpers

  def initialize(employee)
    @employee = employee
  end

  def purchase_edit_link(record)
    if @employee.admin?
      edit_admin_purchase_path(record)
    else
      edit_purchase_path(record)
    end
  end

  def purchase_show_link(record)
    if @employee.admin?
      admin_purchase_path(record)
    end
  end

  def purchase_destroy_link(record)
    if @employee.admin?
      admin_purchase_path(record)
    else
      purchase_path(record)
    end
  end

  def purchase_status(record)
    status = record.status
    if @employee.manager?
      "#{status} - #{record.formatted_updated_at}"
    else
      status
    end
  end
end