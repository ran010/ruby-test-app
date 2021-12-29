class Purchase < ApplicationRecord
  belongs_to :employee

  enum status: %i[requested processing cancelled closed]

  delegate :name, to: :employee
  delegate :email, to: :employee

  def self.permitted_attributes
    [:id, :notes, :employee_id, :status]
  end

  def formatted_updated_at
    "#{updated_at.strftime('%d/%m/%Y')} - #{updated_at.strftime('%H:%M')}"
  end
end
