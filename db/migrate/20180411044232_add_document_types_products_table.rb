class AddDocumentTypesProductsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :document_types_products, id: false do |t|
      t.belongs_to :product, index: true
      t.belongs_to :document_type, index: true
    end
  end
end
