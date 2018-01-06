class CreateEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :emails do |t|
      t.string :to
      t.text :body
      t.date :send_date_at

      t.timestamps
    end
  end
end
