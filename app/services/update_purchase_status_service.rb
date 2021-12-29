class UpdatePurchaseStatusService < ApplicationService
  def initialize(id)
    return unless id.present?
    @purchase = get_purchase(id)
  end

  def get_purchase(id)
    begin
     Purchase.find(id)
    rescue  => e
      Rails.logger.error e
      nil
    end
  end

  def call
    return nil if (@purchase.blank? || @purchase.closed?)
    begin
      @purchase.update(status: purchase_new_status)
    rescue  => e
      Rails.logger.error e
    end
  end

  private
  def purchase_new_status
    case @purchase.status
    when 'requested'
      :processing
    when 'processing'
      :closed
    when 'cancelled'
      :closed
    end
  end
end