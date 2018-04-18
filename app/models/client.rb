class Client < ApplicationRecord
  attr_reader :per_page
  @per_page = 7
  attr_writer :inline_forms_attribute_list
  has_paper_trail

  has_many :work_processes

  def _presentation
    html = "<div class='client-presentation'>"
    html << "<h4>#{name} | #{work_processes.count} processes</h4>"
    html << "<p>We are waiting for</strong>: #{pending_documents_text}<p>" unless pending_documents_text.empty?
    html << "<p>Delivered documents: #{delivered_documents.join(', ')}<p>" unless delivered_documents.empty?
    html << "</div>"
    html.html_safe
  end

  def pending_documents_text
    pending = required_documents - delivered_documents
    pending.join(', ')
  end

  def required_documents
    products = work_processes.map {|w| w.products }.flatten
    required_documents = []
    products.each {|p| required_documents << p.document_types.map {|d| d.name }.flatten }
    required_documents.flatten
  end

  def delivered_documents
    delivered_documents = []
    work_processes.each {|w| delivered_documents << w.documents.map { |d| d.document_type.name }.flatten }
    delivered_documents.flatten
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
