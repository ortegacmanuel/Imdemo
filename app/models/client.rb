class Client < ApplicationRecord
  attr_reader :per_page
  @per_page = 7
  attr_writer :inline_forms_attribute_list
  has_paper_trail

  has_many :work_processes

  def _presentation
    "#{name}"
  end


  def inline_forms_attribute_list
    @inline_forms_attribute_list ||= [
      [ :name , "name", :text_field ],
      [ :address , "address", :text_area_without_ckeditor ],
      [ :work_processes , "work_processes", :associated ],
    ]
  end


  def self.not_accessible_through_html?
    false
  end

  def self.order_by_clause
    nil
  end


end
