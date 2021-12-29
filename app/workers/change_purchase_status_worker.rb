class ChangePurchaseStatusWorker
  include Sidekiq::Worker

  def perform(id)
    UpdatePurchaseStatusService.call(id)
  end
end
