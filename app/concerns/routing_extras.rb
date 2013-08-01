module RoutingExtras
  def ajax_required!
    raise ActiveRecord::RecordNotFound unless request.xhr?
  end
end
