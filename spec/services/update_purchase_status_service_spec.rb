require 'rails_helper'

RSpec.describe UpdatePurchaseStatusService, type: :service do
  let(:purchase) {create(:purchase)}
  let(:id) {purchase.id}
  subject { UpdatePurchaseStatusService.new(id) }

  describe '.call' do
    context 'purchase is present' do
      it 'updates purchase status' do
        expect(purchase.status).to eq("requested")
        subject.call
        purchase.reload
        expect(purchase.status).to eq("processing")
      end
    end
    context 'when purchase is absent' do
      let(:id){ 1007 }
      it 'returns nil' do
        expect(subject.call).to eq(nil)
      end
    end
  end
end