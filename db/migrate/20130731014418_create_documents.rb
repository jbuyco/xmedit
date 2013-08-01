class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :slug, null: false
      t.text :description, null: false, default: ""
      t.timestamps
    end
  end
end
