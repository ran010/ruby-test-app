class Admin::PurchasesController < ::BaseController

  def change_status
    authorize [:admin, Purchase],  policy_class: Admin::PurchasePolicy
    ChangePurchaseStatusWorker.new.perform(@record.id)
    redirect_to admin_purchases_path
  end

  private

  def set_record_actions
    [:change_status]
  end

  def redirect_create_path
    admin_purchases_path
  end

  def record_name
    'Purchase'
  end

  def authorize_action_records
    authorize [:admin, @records],  policy_class: Admin::PurchasePolicy
  end

  def authorize_action_record
    authorize [:admin, @record],  policy_class: Admin::PurchasePolicy
  end
end
