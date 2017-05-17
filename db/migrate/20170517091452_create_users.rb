class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password
      t.integer :type_id

      t.timestamps
    end
  end
end
