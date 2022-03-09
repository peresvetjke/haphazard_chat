class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.integer :author_id, null: false
      t.references :chat, null: false, foreign_key: true
      t.string :body, null: false

      t.timestamps
    end
  end
end
