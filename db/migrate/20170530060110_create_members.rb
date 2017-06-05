class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.integer :role_id

      t.timestamps
    end
  end
end
