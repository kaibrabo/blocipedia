class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :confirmable, :registerable, :recoverable, :rememberable, :trackable, :validatable

    has_many :wikis, dependent: :destroy

    after_initialize :default_to_standard_role, :if => :new_record?

    enum role: [:standard, :premium, :admin]


    def to_premium
        self.role = :premium
        self.save!
    end

    def is_premium
        self.role == "premium"
    end

    def to_admin
        self.role = :admin
        self.save!
    end

    def is_admin
        self.role == "admin"
    end

    def to_standard
        self.role = :standard
        self.save!
    end

    def is_standard
        self.role == "standard"
    end

    private

    def default_to_standard_role
        self.role ||= :standard
    end


end
