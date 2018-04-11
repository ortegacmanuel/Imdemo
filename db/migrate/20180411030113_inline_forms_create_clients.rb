class InlineFormsCreateClients < ActiveRecord::Migration[5.0]

  def self.up
    create_table :clients do |t|
      t.string :name
      t.text :address 
      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end

end
