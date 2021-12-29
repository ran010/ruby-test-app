module PurchaseHelper
  def sort_attribute(attribute)
    link_to(icon("arrow-up", class: "text-success"), admin_purchases_path(order_attr: attribute, order_type: :asc)) +
    link_to(icon("arrow-down", class: "text-success"), admin_purchases_path(order_attr: attribute, order_type: :desc))
  end
end