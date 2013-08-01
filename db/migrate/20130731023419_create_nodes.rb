class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.belongs_to :document
      t.string :name, null: false
      t.string :value, null: false
      t.timestamps
    end
    add_index :nodes, :document_id
  end
end
