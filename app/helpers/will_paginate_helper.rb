module WillPaginateHelper
  class CustomRenderer < WillPaginate::ActionView::LinkRenderer
    def to_html
      html = '<ul class="pagination">'
      html += pagination.map do |item|
        item.is_a?(Integer) ?
          page_number(item) :
          send(item)
      end.join()
      html += '</ul>'
    end
    def page_number(page)
      if page == current_page
        tag(:li, "<a href='/students?page=#{page}'>#{page}</a>", class: "active")
      else
        tag(:li, "<a href='/students?page=#{page}'>#{page}</a>")
      end
    end
    def previous_or_next_page(page, text, classname, aria_label = nil)
      if page
        tag(:li, "<a href='/students?page=#{page}'>#{text}</a>")
      else
        tag(:li, "<a>#{text}</a>", class: "disabled")
      end
    end
    def gap
      tag(:li, "<a href=''>...</a>", class: "disabled")
    end
  end
  def will_paginate_nicely(collection)
    will_paginate(
      collection, 
      inner_window: 1,
      outer_window: 0,
      next_label: '>',
      previous_label: '<',
      renderer: CustomRenderer
    )
  end
end