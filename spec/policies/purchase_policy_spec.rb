require 'rails_helper'

RSpec.describe PurchasePolicy, type: :policy do
  let(:purchase) { Purchase.new }

  subject { described_class }

  permissions :new? do
    it_behaves_like 'purchase permission for show action'
  end

  permissions :show? do
    it_behaves_like 'purchase permission for show action'
  end

  permissions :create? do
    it_behaves_like 'purchase permission for show action'
  end

  permissions :update? do
    it_behaves_like 'purchase permission for edit action'
  end

  permissions :destroy? do
    it_behaves_like 'purchase permission for edit action'
  end
end
