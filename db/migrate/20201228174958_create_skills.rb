class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.string :student_id
      t.string :skill_name

      t.timestamps
    end
  end
end
