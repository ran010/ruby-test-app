class UpdatePurchaseStatusService < ApplicationService
  def initialize(id)
    return unless id.present?
    @purchase = get_purchase(id)
  end

  def get_purchase(id)
    Purchase.find(id)
  end

  def call
    return if @purchase.closed?
    begin
      @purchase.update(status: purchase_new_status)
    rescue  => e
      Rails.logger.error e
    end
  end

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