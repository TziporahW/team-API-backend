class RemovePasswordConfirmationFromStudents < ActiveRecord::Migration[6.0]
  def change
    remove_column :students, :password_digest, :string
    remove_column :students, :password_confirmation, :string
  end
end
