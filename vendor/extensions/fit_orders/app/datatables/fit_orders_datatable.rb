

class FitOrdersDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: FitOrders.count,
      iTotalDisplayRecords: fit_orders.total_entries,
      aaData: data
    }
  end

private

  def data
    fit_orders.map do |fit_order|
      [
        link_to(fit_order.order_id, fit_order),
        h(fit_order.group_number),
        h(fit_order.out_date),
        h(fit_order.return_date),
        h(fit_order.book_id),
        h(fit_order.book_name)
      ]
    end
  end

  def fit_orders
    @fit_orders ||= fetch_fit_orders
  end

  def fetch_fit_orders
    fit_orders = FitOrders.order("#{sort_column} #{sort_direction}")
    fit_orders = fit_orders.page(page).per_page(per_page)
    if params[:sSearch].present?
      fit_orders = fit_orders.where("name like :search or category like :search", search: "%#{params[:sSearch]}%")
    end
    fit_orders
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name category released_on price]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end

