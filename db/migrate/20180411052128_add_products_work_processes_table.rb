class AddProductsWorkProcessesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :products_work_processes, id: false do |t|
      t.belongs_to :product, index: true
      t.belongs_to :work_process, index: true
    end
  end
end
