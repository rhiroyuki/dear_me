class AddEmailConfirmColumnsToEmails < ActiveRecord::Migration[5.1]
  def change
    add_column :emails, :confirmed_at, :datetime 
    add_column :emails, :confirmation_token, :string

    add_index :emails, :confirmation_token, unique: true
  end
end
