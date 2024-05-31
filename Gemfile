source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo.split('/').last}" }

ruby "3.1.2"

gem "rails", "~> 7.0.4"
gem "sqlite3", "~> 1.4"
gem "puma", "~> 5.0"
gem "bootsnap", ">= 1.4.4", require: false
gem "jbuilder", "~> 2.11"
gem "devise"
gem "active_model_serializers"
gem "webpacker", "~> 5.0"
gem "turbo-rails", "~> 1.0"
gem "stimulus"
gem "dotenv-rails"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rspec-rails", "~> 5.0"
  gem "factory_bot_rails"
  gem "faker"
  gem "letter_opener"
end

group :development do
  gem "web-console", ">= 4.1.0"
  gem "rack-mini-profiler", "~> 2.0"
  gem "listen", "~> 3.3"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0"
end

group :test do
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver"
  gem "webdrivers"
end
