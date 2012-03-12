Reot
====

Simple library for converting [ttf](http://en.wikipedia.org/wiki/TrueType) to [eot](http://en.wikipedia.org/wiki/Embedded_OpenType) format. It is using [ttf2eot](http://code.google.com/p/ttf2eot/), just instead of using console, you can use simple ruby module.


Install
-------

```gem install reot```

Example
-------

```ruby
  Reot.convert!('awesome_webfont.ttf', 'awesome_webfont.eot') #=> true
```

Generates ```awesome_webfont.eot```!
