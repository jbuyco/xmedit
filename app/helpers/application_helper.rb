module ApplicationHelper
  def dark_icon(name)
    content_tag("i", nil, class: "icon-#{name}")
  end

  def icon(name)
    content_tag("i", nil, class: "icon-#{name} icon-white")
  end
end
