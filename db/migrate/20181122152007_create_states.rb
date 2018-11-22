class CreateStates < ActiveRecord::Migration[5.1]
  def change
    create_table :states do |t|
      t.string :title
      t.text :description
      t.integer :note
      t.string :date
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
