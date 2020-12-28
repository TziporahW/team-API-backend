class ChangesPasswordDigestToPasswordStudents < ActiveRecord::Migration[6.0]
  def change
    rename_column :students, :password_digest, :password
  end
end
