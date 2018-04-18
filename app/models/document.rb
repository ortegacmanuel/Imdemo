class Document < ApplicationRecord
  attr_reader :per_page
  @per_page = 7
  attr_writer :inline_forms_attribute_list
  has_paper_trail

  belongs_to :document_type
  belongs_to :work_process

  def _presentation
    "#{name}"
  end


  def inline_forms_attribute_list
    @inline_forms_attribute_list ||= [
      [ :name , "name", :text_field ],
      [ :document_type, "document_type", :dropdown ],
    ]
  end


  def self.not_accessible_through_html?
    true
  end

  def self.order_by_clause
    nil
  end


end
