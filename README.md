# Roda::WillPaginate

Use this plugin to use Will Paginate from Roda.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'roda-will_paginate'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install roda-will_paginate

## Usage

Add the plugin directive to your app

```ruby
plugin :will_paginate
```

On your views you can use the same method you would use on a Rails app ie.

```ruby
<%= will_paginate @collection %>
```
to include pagination links.

In case you would like to customize the generated links you need to implement a renderer.

## Bootstrap Pagination Renderer:

We include a customized renderer if you are working with Twitter bootstrap, just:

```ruby
require 'roda/will_paginate/bootstrap_pagination_renderer'
```

in you application and then specify the renderer to Will Paginate:

```
<%= will_paginate @collection, renderer: Roda::WillPaginate::BootstrapPaginationRenderer %>

```

## Contributing

1. Fork it ( https://github.com/manuca/roda-will_paginate/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
