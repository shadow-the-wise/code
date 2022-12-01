source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.3", ">= 7.0.3.1"

gem "sprockets-rails"
gem "sqlite3", "~> 1.4"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

# -----------------------------------------------------------------------------
# Pry
# -----------------------------------------------------------------------------
gem "pry"
gem "pry-rails", "~> 0.3.9"
gem "pry-byebug", "~> 3.9"
# gem "pry-doc", "~> 1.3"

# -----------------------------------------------------------------------------
# Red carpet
# -----------------------------------------------------------------------------
gem "redcarpet", "~> 3.5", ">= 3.5.1"

# -----------------------------------------------------------------------------
# Will paginate
# -----------------------------------------------------------------------------
gem "will_paginate", "~> 3.3"

# -----------------------------------------------------------------------------
# Scss
# -----------------------------------------------------------------------------
# Use Sass to process CSS
gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "better_errors", "~> 2.9", ">= 2.9.1"
  gem "listen", "~> 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "amazing_print", "~> 1.2", ">= 1.2.1"
  gem "binding_of_caller", "~> 1.0"
  gem "solargraph", "~> 0.47.2"
  gem "rubocop-minitest", "~> 0.15.0"
  gem "rubocop-packaging", "~> 0.5.1"
  gem "rubocop-performance", "~> 1.11", ">= 1.11.5"
  gem "rubocop-rails", "~> 2.11", ">= 2.11.3"
end


group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
