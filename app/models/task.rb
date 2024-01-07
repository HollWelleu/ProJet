class Task < ApplicationRecord

    # Validations
    validates_presence_of :name

    belongs_to :project

end
