class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :from_number
      t.text :message_body

      t.timestamps
    end
  end
end
