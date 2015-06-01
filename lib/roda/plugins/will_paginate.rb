require 'will_paginate/view_helpers/link_renderer'

class Roda
  module RodaPlugins
    module WillPaginate

      def self.configure(app, opts = {})
        app.opts[:will_paginate] = opts.dup

        opts = app.opts[:will_paginate]
        opts[:renderer] ||= ::Roda::WillPaginate::LinkRenderer

        if opts[:renderer].is_a?(Symbol)
          c_name = "Roda::WillPaginate::#{opts[:renderer].to_s.capitalize}PaginationRenderer"
          opts[:renderer] = const_get(c_name)
        end
      end

      module InstanceMethods
        include ::WillPaginate::ViewHelpers

        def will_paginate(collection, options = {}) #:nodoc:
          super(collection, opts[:will_paginate].merge(options))
        end
      end
    end

    register_plugin(:will_paginate, WillPaginate)
  end
end
