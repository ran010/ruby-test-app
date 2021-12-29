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

  permissions :edit? do
    it_behaves_like 'purchase permission for edit action'
  end

  permissions :update? do
    it_behaves_like 'purchase permission for edit action'
  end

  permissions :destroy? do
    it "gives access if employee role is manager" do
      expect(subject).to permit(Employee.new(role: :manager), Purchase.new(notes: "test"))
    end
    it "denies access if employee role is agent" do
      expect(subject).not_to permit(Employee.new(role: :agent), Purchase.new(notes: "test"))
    end
    it "gives access if employee role is admin" do
      expect(subject).to permit(Employee.new(role: :admin), Purchase.new(notes: "test"))
    end  end
end
