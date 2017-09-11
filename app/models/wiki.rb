class Wiki < ApplicationRecord
    belongs_to :user, optional: true
    validates :user, presence: true
    has_many :collaborators
    has_many :users, through: :collaborators
end
