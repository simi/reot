Reot [![Build Status](https://secure.travis-ci.org/simi/reot.png?branch=master)](http://travis-ci.org/simi/reot)
====

Simple library for converting [ttf](http://en.wikipedia.org/wiki/TrueType) to [eot](http://en.wikipedia.org/wiki/Embedded_OpenType) format. It is using [ttf2eot](http://code.google.com/p/ttf2eot/), just instead of using console, you can use simple ruby module.

Ruby 1.9 only!

Install
-------

```gem install reot```

Example
-------

```ruby
  Reot.convert!('awesome_webfont.ttf', 'awesome_webfont.eot') #=> true
```

Generates ```awesome_webfont.eot```!
