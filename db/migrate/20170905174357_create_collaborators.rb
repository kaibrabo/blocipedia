class CreateCollaborators < ActiveRecord::Migration[5.1]
  def change
    create_table :collaborators do |t|
        t.integer :user_id
        t.integer :wiki_id
        t.integer :collaborator, default: 0

        t.timestamps
    end
  end
end
