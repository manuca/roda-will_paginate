require 'roda/will_paginate/link_renderer'

class Roda
  module WillPaginate
    class BootstrapPaginationRenderer < LinkRenderer
      protected

      def page_number(page)
        unless page == current_page
          tag(:li, link(page, page, :rel => rel_value(page)))
        else
          tag(:li, link(page, '#'), :class => "active")
        end
      end

      def previous_or_next_page(page, text, classname)
        if classname == 'previous_page'
          classname = 'prev'
        elsif classname == 'next_page'
          classname = 'next'
        end

        if page
          tag(:li, link(text, page, :class => classname))
        else
          tag(:li, link(text, '#', :class => classname + ' disabled'))
        end
      end

      def html_container(html)
        tag(:ul, html, container_attributes)
      end
    end
  end
end
