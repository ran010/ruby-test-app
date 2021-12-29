module Searchable
  extend ActiveSupport::Concern

  def perform_search
    records = record_class.joins(:employee)
    records = records.where('employees.name ilike ? or employees.email ilike ?',
                            "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    @records = if build_order
                 records.order(build_order)
               else
                 records
               end
  end

  def sanitize_search_attributes
    return unless params[:q].present?
    params[:q].permit!
    sanitized_attrs = params[:q].to_h
    sanitized_attrs.each do |k, v|
      sanitized_attrs.except!(k) if v.blank?
    end
    sanitized_attrs
  end

  def build_order
    return nil if params[:order_attr].blank? || params[:order_type].blank?
    "#{params[:order_attr]} #{params[:order_type]}"
  end
end