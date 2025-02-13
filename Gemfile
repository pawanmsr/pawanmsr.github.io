source "https://rubygems.org"

group :jekyll_plugins do
  gem 'jekyll-feed', '~> 0.17.0'
  gem 'jekyll-seo-tag', '~> 2.8'
  gem 'jekyll-archives', '~> 2.2', '>= 2.2.1'
  gem 'jekyll-sitemap', '~> 1.4'
  gem 'jekyll-include-cache'
end

# Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
# and associated library.
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.1", :platforms => [:mingw, :x64_mingw, :mswin]

# Lock `http_parser.rb` gem to `v0.6.x` on JRuby builds since newer versions of the gem
# do not have a Java counterpart.
gem "http_parser.rb", "~> 0.6.0", :platforms => [:jruby]

# rakefile automation on test and production
group :test, :production do
  gem "faraday-retry", "~> 2.2"
  gem "faraday", "~> 2.11"
  gem "yaml", "~> 0.3.0"
end

# rakefile automation on development and test
group :development, :test do
  gem "sass-embedded", "~> 1.78"
  gem "fileutils", "~> 1.7"
end
