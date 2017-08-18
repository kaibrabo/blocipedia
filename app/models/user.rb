class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :confirmable, :registerable, :recoverable, :rememberable, :trackable, :validatable

    has_many :wikis, dependent: :destroy

    after_initialize :default_to_standard_role, :if => :new_record?

    enum role: [:standard, :premium, :admin]


    private

    def default_to_standard_role
        self.role ||= :standard
    end


end
