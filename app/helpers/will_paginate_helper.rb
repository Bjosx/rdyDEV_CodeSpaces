module WillPaginateHelper
  def will_paginate_nicely(collection)
    options = {
      previous_label: "&lt;",
      next_label: "&gt;",
      container: "false",
      inner_window: 2,
      outer_window: 0,
      renderer: "PaginationRenderer"
    }
    will_paginate(collection, options)
  end
end