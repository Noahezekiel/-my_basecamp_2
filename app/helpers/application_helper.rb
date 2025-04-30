# app/helpers/application_helper.rb
module ApplicationHelper
  def flash_class(level)
    case level.to_sym
    when :notice then "alert alert-success"
    when :alert  then "alert alert-danger"
    when :error  then "alert alert-danger"
    else "alert alert-info"
    end
  end

  def render_empty_state(collection, message:)
    if collection.any?
      yield
    else
      content_tag(:p, message, class: "text-muted fst-italic")
    end
  end
end