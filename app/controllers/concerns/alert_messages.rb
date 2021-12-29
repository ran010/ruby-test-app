module AlertMessages
  extend ActiveSupport::Concern

  private

  def create_success_message
    "#{record_name} successfully created"
  end

  def update_success_message
    "#{record_name} successfully updated"
  end

  def destroy_success_message
    "#{record_name} successfully deleted"
  end

  def create_failed_message
    "#{record_name} failed to create"
  end

  def update_failed_message
    "#{record_name} failed to update"
  end

  def destroy_failed_message
    "#{record_name} failed to destroy"
  end
end