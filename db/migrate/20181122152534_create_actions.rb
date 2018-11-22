class CreateActions < ActiveRecord::Migration[5.1]
  def change
    create_table :actions do |t|
      t.string :title
      t.text :description
      t.string :deadline
      t.references :objective, foreign_key: true

      t.timestamps
    end
  end
end
