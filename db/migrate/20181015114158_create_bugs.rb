class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.string :title,                unique: true
      t.string :description
      t.string :text
      t.date :deadline
      t.string :screenshot
      t.string :status
      t.string :type
      t.integer :user_id
      t.integer :developer_id
      t.integer :project_id

      t.timestamps
    end
  end
end
