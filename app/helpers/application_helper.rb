module ApplicationHelper
  def icon(name)
    content_tag("i", nil, class: "icon-#{name} icon-white")
  end
end
