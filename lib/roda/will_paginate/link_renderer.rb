require 'will_paginate/view_helpers/link_renderer'

class Roda
  module WillPaginate
    class LinkRenderer < ::WillPaginate::ViewHelpers::LinkRenderer
      protected

      def url(page)
        str = File.join(request.script_name.to_s, request.path_info)
        params = request.GET.merge(param_name.to_s => page.to_s)
        params.update @options[:params] if @options[:params]
        str << '?' << build_query(params)
      end

      def request
        @template.request
      end

      def build_query(params)
        Rack::Utils.build_nested_query params
      end
    end
  end
end
