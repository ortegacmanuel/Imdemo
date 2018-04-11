class InlineFormsCreateWorkProcesses < ActiveRecord::Migration[5.0]

  def self.up
    create_table :work_processes do |t|
      t.string :name 
      t.text :comments 
      t.belongs_to :client 
      t.timestamps
    end
  end

  def self.down
    drop_table :work_processes
  end

end
