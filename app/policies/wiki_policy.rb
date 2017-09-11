class WikiPolicy < ApplicationPolicy

    class Scope
        attr_reader :user, :scope

        def initialize(user, scope)
            @user = user
            @scope = scope
        end

        def resolve
            if @user.is_admin || @user.is_premium
                return @scope.all
            elsif @user.is_standard
                return @scope.joins(:collaborators).where(collaborators: {user_id: @user_id}) + @scope.where(private: false)
            else
                return @scope.where(private: false)
            end
        end
    end

end
