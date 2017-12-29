# StringTemplate

The fastest template engine for Rails.


## Concept

Ruby's String literal has such a powerful interpolation mechanism.
It's almost a template engine, it's the fastest way to compose a String, and the syntax is already very well known by every Ruby programmer.
Why don't we use this for the view files in our apps?


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'string_template'
```

And then execute:

    % bundle


## Syntax

StringTemplate's syntax is based on Ruby's String interpolation.
Plus, you can use Action View features.

### Example
Here's an example of a scaffold generated ERB template, and its string\_template version.

ERB:
```
<p id="notice"><%= notice %></p>

<p>
  <strong>Title:</strong>
  <%= @post.title %>
</p>

<p>
  <strong>Body:</strong>
  <%= @post.body %>
</p>

<%= link_to 'Edit', "/posts/#{@post.id}/edit" %> |
<%= link_to 'Back', '/posts' %>
```

string\_template:
```
<p id="notice">#{ notice }</p>

<p>
  <strong>Title:</strong>
  #{ @post.title }
</p>

<p>
  <strong>Body:</strong>
  #{ @post.body }
</p>

#{ link_to 'Edit', "/posts/#{@post.id}/edit" } |
#{ link_to 'Back', '/posts' }
```

### More Examples
Please take a look at [the tests](https://github.com/amatsuda/string_template/blob/master/test/string_template_test.rb) for actual examples.


## Filenames
By default, string\_template renders view files with `.string` extension, e.g. `app/views/posts/show.html.string`


## So, Should We Rewrite Everything with This?
string\_template may not be the best choice as a general purpose template engine.
It may sometimes be hard to express your template in a simple and maintainable code, especially when the template includes some business logic.
So this template engine is recommended to use only for performance hotspots.
For other templates, you might better use your favorite template engine such as haml, or haml, or haml.


## Benchmark
Following is the benchmark result showing how string\_template is faster than ERB (Erubi, to be technically accurate), executed on Ruby trunk (2.6).
This repo includes [this actual benchmarking script](https://github.com/amatsuda/string_template/blob/master/benchmark.rb) so that you can try it on your machine.

```
% ruby benchmark.rb
Warming up --------------------------------------
                 erb   993.525  i/100ms
              string     1.911k i/100ms
Calculating -------------------------------------
                 erb    11.012k i/s -     49.676k in 4.511268s
              string    22.029k i/s -     95.529k in 4.336571s

Comparison:
              string:     22028.7 i/s
                 erb:     11011.5 i/s - 2.00x  slower
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/amatsuda/string_template.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
