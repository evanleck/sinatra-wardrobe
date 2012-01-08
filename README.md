# Sinatra Wardrobe

A way to dress up Sinatra with static file routing based on a few params.

Require in your `Gemfile`

```ruby
gem 'sinatra-wardrobe'
```

And use it with the `suit_up!` method.

```ruby
suit_up! directories: './views', extensions: '.md'
```

Or, for a little more control:

```ruby
suit_up! directories: ['./views/blog', './views/static'], extensions: ['.md', '.erb'], excludes: 'layout.erb', layout_engine: :erb
```

## Defaults

By default, `Sinatra::Wardrobe` will look for files with a `.md` extension in the `./views` directory, ignoring `layout.erb` and assuming a `layout_engine` of `:erb`.

Currently it only supports `.erb`, `.md` and `.markdown` but there are more to come.

## Helpers

* `hats` will return the array of Hash objects that `Sinatra::Wardrobe` uses to bind the `get` requests and serve your files.
* `hat_rack` is an HTML helper that generates an (by default) unordered list with links to each of the files in the `hats` array.

[MIT Licensed](http://evan.mit-license.org/)
