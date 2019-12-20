class Heroine < ApplicationRecord
    belongs_to :power

    # Validations
    validates :super_name, { :uniqueness => true }

end
