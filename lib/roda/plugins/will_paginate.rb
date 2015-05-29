require 'will_paginate/view_helpers/link_renderer'

class Roda
  module RodaPlugins
    module WillPaginate
      module InstanceMethods
        include ::WillPaginate::ViewHelpers

        def will_paginate(collection, options = {}) #:nodoc:
          options = options.merge(:renderer => ::Roda::WillPaginate::LinkRenderer) unless options[:renderer]
          super(collection, options)
        end
      end
    end

    register_plugin(:will_paginate, WillPaginate)
  end
end
