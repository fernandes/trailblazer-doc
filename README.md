# Trailblazer Doc

This gem provides an (ultra) this layer that wraps the forms and representable data into something ready to be consumed.

What I mean? Imagine (yeah, this was the real case that inspired the gem) that you wanna document your API, you already has all your contracts and representers extremely defined, why do we need to redeclare everything on swagger.

And worse, how to keep that in sync? This is completely insane!!1

How to use it?

For Reform, just require the reform (it's not autoloaded because you can use just for reform/representable)

```ruby
require 'trailblazer/doc/reform'

class AlbumForm < Reform::Form
  include Reform::Doc

  property :title
  validates :title, presence: true
end
```

```ruby
require 'trailblazer/doc/representable'

class AlbumRepresenter < Representable::Decorator
  include Representable::JSON
  include Representable::Doc

  property :id
  property :title
end
```

Then after that you can access some data like:

```ruby
AlbumForm.doc.properties
# [:title]

AlbumForm.doc.validations
# {
#   :title=>[ {:presence=>true} ],
#   :year=>[ {:presence=>true, :numericality=>true} ]
# }
```

This is just the first step, the next (aka Roadmap) are:

- [ ] Provide a configurator so we only allocate data in development / testing, never in production
- [ ] Maybe provide some better API to access all the [Reform API](http://trailblazer.to/gems/reform/api.html) and [Representable API](http://trailblazer.to/gems/representable/3.0/api.html)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'trailblazer-doc'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install trailblazer-doc

## Development

That usual red-green-refactor

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fernandes/trailblazer-doc. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

TL;DR As human beings, living in the same world, respect everyone that participates in this project, not in your own definition of respect, but in other's definition; If in doubt ask the other part. **Spread kindness.**

Everyone interacting in the Trailblazer::Doc project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/fernandes/trailblazer-doc/blob/master/CODE_OF_CONDUCT.md).
