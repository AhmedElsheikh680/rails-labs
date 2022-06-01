class ChangeEmailInUserToUnique < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :email, :string , index: {unique: true, name: 'unique_emails'}

  end
end
