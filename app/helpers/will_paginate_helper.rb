require "custom_pagination_renderer"
module WillPaginateHelper
  def will_paginate_nicely(collection)
    will_paginate(
      collection, 
      inner_window: 1,
      outer_window: 0,
      next_label: '>',
      previous_label: '<',
      renderer: CustomPaginationRenderer.new
    )
  end
end