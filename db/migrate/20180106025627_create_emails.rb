class CreateEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :emails do |t|
      t.string :to, null: false
      t.text :body, null: false
      t.date :send_date_at, null: false

      t.timestamps
    end
  end
end
