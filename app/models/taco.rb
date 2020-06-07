class Taco < ApplicationRecord
    validates_presence_of :meat
    validates_inclusion_of :meat, in: %w[Steak Chicken], message: 'is not included in the meats list'
end
