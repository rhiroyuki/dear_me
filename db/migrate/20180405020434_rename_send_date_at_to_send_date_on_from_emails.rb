class RenameSendDateAtToSendDateOnFromEmails < ActiveRecord::Migration[5.1]
  def change
    rename_column :emails, :send_date_at, :send_date_on
  end
end
