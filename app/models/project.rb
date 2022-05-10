class Project < ApplicationRecord
    def archived?
  		name == 'archived'
    end
end
