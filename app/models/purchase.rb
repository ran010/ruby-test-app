class Purchase < ApplicationRecord
    belongs_to :employees
    enum status: %i[requested processing cancelled closed]
end
