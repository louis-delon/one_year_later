class CreateObjectives < ActiveRecord::Migration[5.1]
  def change
    create_table :objectives do |t|
      t.string :title
      t.text :description
      t.string :deadline
      t.references :state, foreign_key: true

      t.timestamps
    end
  end
end
