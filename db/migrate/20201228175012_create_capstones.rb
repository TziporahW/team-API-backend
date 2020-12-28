class CreateCapstones < ActiveRecord::Migration[6.0]
  def change
    create_table :capstones do |t|
      t.string :student_id
      t.string :name
      t.string :description
      t.string :url
      t.string :screenshot_url

      t.timestamps
    end
  end
end
