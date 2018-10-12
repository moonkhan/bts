class CreateProjectsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :projects_users do |t|
      t.integer :user_id,              null: false
      t.integer :project_id,           null: false
    end
    add_index(:projects_users, [:user_id, :project_id], unique: true)
  end
end
