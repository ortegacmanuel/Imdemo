class InlineFormsCreateDocumentTypes < ActiveRecord::Migration[5.0]

  def self.up
    create_table :document_types do |t|
      t.string :name 
      t.timestamps
    end
  end

  def self.down
    drop_table :document_types
  end

end
