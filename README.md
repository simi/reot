Reot
====

Simple library for converting [ttf](http://en.wikipedia.org/wiki/TrueType) to [eot](http://en.wikipedia.org/wiki/Embedded_OpenType) format. It is using [ttf2eot](http://code.google.com/p/ttf2eot/), just instead of using console, you can use simple ruby module.

Example
-------

```ruby
  Reot.convert!('awesome_webfont.ttf') #=> true
```

Your converted file is now in same folder with ttf, just with added
'.eot' extension.
