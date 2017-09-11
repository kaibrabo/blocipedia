class Collaborator < ApplicationRecord
    belongs_to :user
    belongs_to :wiki

    def self.create_from_user_ids(user_ids, wiki_id)
        user_ids.map { |uid|
            uid = uid.to_i
            if uid > 0
                Collaborator.find_or_create_by(user_id: uid, wiki_id: wiki_id)
            else
                nil
            end
        }.compact

    end
end
