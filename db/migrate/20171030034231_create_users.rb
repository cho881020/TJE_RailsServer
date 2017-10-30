class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :gender
      t.string :name
      t.string :loginId
      t.string :password
      t.datetime :birthday
      t.timestamps
    end
  end
end
