require 'rails_helper'

RSpec.describe Admin::PurchasePolicy, type: :policy do
  let(:purchase) { Admin::Purchase.new }

  subject { described_class }

  permissions :new? do
    it_behaves_like 'admin purchase permissions for new action'
  end

  permissions :show? do
    it_behaves_like 'admin purchase permissions for new action'
  end

  permissions :create? do
    it_behaves_like 'admin purchase permissions for new action'
  end

  permissions :update? do
    it_behaves_like 'admin purchase permissions for new action'
  end

  permissions :destroy? do
    it_behaves_like 'admin purchase permissions for new action'
  end

  permissions :change_status? do
    it_behaves_like 'admin purchase permissions for new action'
  end
end
