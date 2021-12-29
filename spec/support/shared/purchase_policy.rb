RSpec.shared_examples "purchase permission for edit action" do
  it "gives access if employee role is manager" do
    expect(subject).to permit(Employee.new(role: :manager), Purchase.new(notes: "test"))
  end
  it "gives access if employee role is agent" do
    expect(subject).to permit(Employee.new(role: :agent), Purchase.new(notes: "test"))
  end
  it "gives access if employee role is admin" do
    expect(subject).to permit(Employee.new(role: :admin), Purchase.new(notes: "test"))
  end
end

RSpec.shared_examples "purchase permission for show action" do
  it "denies access if employee role is manager" do
    expect(subject).not_to permit(Employee.new(role: :manager), Purchase.new(notes: "test"))
  end
  it "denies access if employee role is agent" do
    expect(subject).not_to permit(Employee.new(role: :agent), Purchase.new(notes: "test"))
  end
  it "gives access if employee role is admin" do
    expect(subject).to permit(Employee.new(role: :admin), Purchase.new(notes: "test"))
  end
end

RSpec.shared_examples "admin purchase permissions for new action" do
  it "denies access if employee role is manager" do
    expect(subject).not_to permit(Employee.new(role: :manager), Purchase.new(notes: "test"))
  end
  it "denies access if employee role is agent" do
    expect(subject).not_to permit(Employee.new(role: :agent), Purchase.new(notes: "test"))
  end
  it "gives access if employee role is admin" do
    expect(subject).to permit(Employee.new(role: :admin), Purchase.new(notes: "test"))
  end
end
