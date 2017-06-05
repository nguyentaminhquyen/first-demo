class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.string :name
      t.string :description
      t.bigint :asginee_id
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
