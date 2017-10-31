class CreateAbsents < ActiveRecord::Migration[5.0]
  def change
    create_table :absents do |t|
      t.datetime :absentDate
      t.string :reason
      t.integer :student_id
      t.integer :lecture_object_id
      t.timestamps
    end
  end
end
