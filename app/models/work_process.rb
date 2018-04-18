class WorkProcess < ApplicationRecord
  attr_reader :per_page
  @per_page = 7
  attr_writer :inline_forms_attribute_list
  has_paper_trail

  belongs_to :client
  has_and_belongs_to_many :products
  has_many :documents

  def _presentation
    "#{name} (#{products_text})"
  end

  def products_text
    products.map(&:name).join(' | ')
  end


  def inline_forms_attribute_list
    @inline_forms_attribute_list ||= [
      [ :name , "name", :text_field ],
      [ :comments , "comments", :text_area_without_ckeditor ],
      [ :header_products, '', :header ],
      [ :products, 'required_products', :check_list ],
      [ :documents , "documents", :associated ],
    ]
  end


  def self.not_accessible_through_html?
    true
  end

  def self.order_by_clause
    "name"
  end


end
