class InlineFormsCreateDocuments < ActiveRecord::Migration[5.0]

  def self.up
    create_table :documents do |t|
      t.string :name
      t.belongs_to :document_type
      t.belongs_to :work_process
      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end

end
