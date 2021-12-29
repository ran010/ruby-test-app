module RecordMethods
  extend ActiveSupport::Concern

  def record_class
    record_name.singularize.constantize
  end

  def record_name
    record_namespace.humanize
  end

  def record_namespace
    controller_path.parameterize.split("-")[-1]
  end

  def exclude_set_record_actions
    []
  end

  def set_record_actions
    []
  end

  def redirect_path
    purchases_path
  end

  def authorize_action_records; end

  def authorize_action_record; end

  def permitted_attribute_with_policy
    record_class.permitted_attributes
  end
end