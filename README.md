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
Please take a look at the tests for actual examples.


## Filenames
By default, string\_template renders view files with `.string` extension, e.g. `app/views/posts/show.html.string`


## So, Should We Rewrite Everything with This?
string\_template may not be the best choice as a general purpose template engine.
It may sometimes be hard to express your template in a simple and maintainable code, especially when the template includes some business logic.
So this template engine is recommended to use only for performance hotspots.
For other templates, you might better use your favorite template engine such as haml, or haml, or haml.


## Benchmark
Following is the benchmark result showing how string\_template is faster than ERB, executed on Ruby trunk (2.6).
This repo includes [this actual benchmarking script](https://github.com/amatsuda/string_template/blob/master/benchmark.rb) so that you can try it on your machine.

```
% ruby benchmark.rb
Warming up --------------------------------------
                 erb   986.519  i/100ms
              string     1.614k i/100ms
Calculating -------------------------------------
                 erb    10.598k i/s -     49.325k in 4.654229s
              string    19.550k i/s -     80.686k in 4.127156s

Comparison:
              string:     19550.0 i/s
                 erb:     10597.9 i/s - 1.84x  slower
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/amatsuda/string_template.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
