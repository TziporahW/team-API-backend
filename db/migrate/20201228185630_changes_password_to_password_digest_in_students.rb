class ChangesPasswordToPasswordDigestInStudents < ActiveRecord::Migration[6.0]
  def change
    rename_column :students, :password, :password_digest
  end
end
