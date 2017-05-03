class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :patient, foreign_key: true

      t.timestamps
    end
    add_foreign_key :patients, :patient
    add_index :messages, [:patient_id, :created_at]
  end
end
