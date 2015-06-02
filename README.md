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

Links generated for pagination will include a parameter `page=[page_no]` that will have to be handled correctly by your application when requesting different pages.

## Making collections work with Will Paginate

Please take into consideration that this plugin only takes care of generating the links to pages on your views, your paginated collections should comply with Will Paginate's requirements, these are defined  in https://github.com/mislav/will_paginate/blob/master/lib/will_paginate/collection.rb.

The easiest way to implement this interface is implementing `current_page, per_page, offset, total_entries, total_pages` as methods of your collection and including `WillPaginate::CollectionMethods` in your collections as well.

## Customizing pagination links

In case you would like to customize the generated links you need to implement a renderer. Please take a look at Will Paginate's documentation to learn how to create your own renderers.

## Alternative Twitter Bootstrap Pagination Theme:

We include a customized renderer if you are working with Twitter bootstrap, just:

```ruby
require 'roda/will_paginate/bootstrap_pagination_renderer'
```

in you application and then specify the renderer to Will Paginate:

```
<%= will_paginate @collection, renderer: :bootstrap %>

```

or

```
<%= will_paginate @collection, renderer: Roda::WillPaginate::BootstrapPaginationRenderer %>

```

Alternative you can set it in the plugin configuration to avoid repeating it
in each helper call:

```ruby
plugin :will_paginate, renderer: :bootstrap
```

or

```ruby
plugin :will_paginate, renderer: Roda::WillPaginate::BootstrapPaginationRenderer
```

## Custom renderers

Please take a look at the [Will Paginate](https://github.com/mislav/will_paginate) docs to see how renderers work.

If you have a custom renderer named Foo you can namespace it inside `Roda::WillPaginate::FooRenderer` and then use the symbol `:foo` to refer to it. For example:

```ruby
plugin :will_paginate, renderer: :foo
```

## Contributing

1. Fork it ( https://github.com/manuca/roda-will_paginate/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
