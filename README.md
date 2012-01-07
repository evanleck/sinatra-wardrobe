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

Currently it only supports `.erb`, `.md` and `.markdown` but there are more to come.

[MIT Licensed](http://evan.mit-license.org/)
