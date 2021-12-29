require "rails_helper"

RSpec.feature 'Purchase', type: :feature do
  describe 'Purchase', js: true  do
    let!(:admin) {create(:employee, role: :admin)}
    let!(:manager) {create(:employee, role: :manager)}
    let!(:agent) {create(:employee, role: :agent)}
    let!(:purchase) {create(:purchase)}
    let!(:purchase_1) {create(:purchase)}
    let!(:purchase_2) {create(:purchase)}

    context 'when employee is admin' do
      before do
        login_as(admin)
      end
      it 'has dashboard access' do
        visit "/purchases"
        expect(page).to have_content "New Purchase"
        expect(page).to have_content "Buyer Name"
        expect(page).to have_content "Buyer Email"
        expect(page).to have_content "Status"
        expect(page).to have_content "Created"
        expect(page).to have_content "Edit"
        expect(page).to have_content "Show"
        expect(page).to have_content "Destroy"
      end
      it 'can create purchase' do
        visit "/admin/purchases/new"
        fill_in 'purchase_notes', with: Faker::Lorem.sentence
        find('#purchase_employee_id').find(:xpath, 'option[2]').select_option
        expect { click_button 'Submit' }.to change { Purchase.count }.by(1)
      end
      it 'can edit purchase' do
        visit "/admin/purchases/#{purchase.id}/edit"
        fill_in 'purchase_notes', with: Faker::Lorem.sentence
        find('#purchase_status').find(:xpath, 'option[2]').select_option
        click_button 'Submit'
      end
      it 'view purchase' do
        visit "/admin/purchases/#{purchase.id}"
        expect(page).to have_content('Change Status')
        click_link 'Change Status'
        expect(current_path).to eq(admin_purchases_path)
        purchase.reload
        expect(purchase.status).to eq('processing')
      end
    end
    context 'when employee is manager' do
      before do
        login_as(manager)
      end
      it 'has dashboard access' do
        visit "/purchases"
        expect(page).not_to have_content "You are not authorized to perform this action."
        expect(page).not_to have_content "New Purchase"
        expect(page).to have_content "Buyer Name"
        expect(page).not_to have_content "Buyer Email"
        expect(page).to have_content "Status"
        expect(page).to have_content "Created"
        expect(page).to have_content "Edit"
        expect(page).not_to have_content "Show"
        expect(page).not_to have_content "Destroy"
        click_link 'Purchases (Admin access)'
        expect(page).to have_content "You are not authorized to perform this action."
      end
      it 'can edit purchase' do
        visit "/purchases/#{purchase.id}/edit"
        fill_in 'purchase_notes', with: Faker::Lorem.sentence
        expect(find(:css,'#purchase_status').disabled?).to be (false)
        expect(find(:css,'#purchase_employee_id').disabled?).to be (true)
        click_button 'Submit'
      end
      it 'cannot view purchase' do
        visit "/purchases/#{purchase.id}"
        expect(page).to have_content "You are not authorized to perform this action."
      end
    end
    context 'when employee is agent' do
      before do
        login_as(agent)
      end
      it 'has dashboard access' do
        visit "/purchases"
        expect(page).not_to have_content "You are not authorized to perform this action."
        expect(page).not_to have_content "New Purchase"
        expect(page).to have_content "Buyer Name"
        expect(page).to have_content "Buyer Email"
        expect(page).to have_content "Status"
        expect(page).to have_content "Created"
        expect(page).to have_content "Edit"
        expect(page).not_to have_content "Show"
        expect(page).not_to have_content "Destroy"
        click_link 'Purchases (Admin access)'
        expect(page).to have_content "You are not authorized to perform this action."
      end
      it 'can edit purchase' do
        visit "/purchases/#{purchase.id}/edit"
        fill_in 'purchase_notes', with: Faker::Lorem.sentence
        expect(find(:css,'#purchase_status').disabled?).to be (true)
        expect(find(:css,'#purchase_employee_id').disabled?).to be (true)
        click_button 'Submit'
      end
      it 'cannot view purchase' do
        visit "/purchases/#{purchase.id}"
        expect(page).to have_content "You are not authorized to perform this action."
      end
    end
  end
end