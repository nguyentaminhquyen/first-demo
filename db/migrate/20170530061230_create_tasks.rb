class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.string :name
      t.string :description
      t.bigint :assignner_id
      t.integer :status
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
