class PurchasesController < BaseController

  private
  def permitted_attribute_with_policy
    policy(record_class).permitted_attributes
  end

  def authorize_action_records
    authorize @records
  end

  def authorize_action_record
    authorize @record
  end
end
