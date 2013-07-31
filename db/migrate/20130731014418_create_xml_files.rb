class CreateXmlFiles < ActiveRecord::Migration
  def change
    create_table :xml_files do |t|
      t.string :slug, null: false
      t.text :description, null: false, default: ""
      t.timestamps
    end
  end
end
