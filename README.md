# Buggy

Youtube link sharing newfeed

## Database setup

Run postgresql docker on port 5432.

```
docker compose up
```

```
./bin/rails db:create
```

## Devise

```
./bin/bundle add devise
./bin/rails generate devise:install
```

Generate user

```
./bin/rails generate devise User
```

Annotate gem

```
./bin/bundle add annotate --group development
./bin/rails g annotate:install
```

DB migrate

```
./bin/rails db:migrate
```

### View

Generate views

```
./bin/rails g devise:views
```

## Homepage

```
./bin/bundle add rubocop rubocop-rails
```

## Rubocop

```
./bin/bundle add rubocop rubocop-rails --group development
```

## Tailwindcss

```
./bin/bundle add tailwindcss-rails
./bin/rails tailwindcss:install
```

## Add username to user

```
./bin/rails g migration add_username_to_users username:string:uniq
./bin/rails db:migrate
```

## Create media

```
./bin/rails g model Medium title:string url:string:not_null description:text user:references
./bin/rails db:migrate
```

## Seed

```
./bin/rails db:seed:replant
```

## Sharing

```
./bin/rails g controller Sharing create
```

## Faraday

http client

```
./bin/bundle add faraday faraday-net_http
```

## Kaminari

```
./bin/bundle add kaminari
./bin/rails g kaminari:config
./bin/rails g kaminari:views default -e erb
```

## RSpec

```
# Gemfile
gem 'rspec-rails', '~> 6.0.0.rc1'

./bin/bundle

./bin/rails g rspec:install

./bin/bundle add factory_bot_rails

# for integration test
./bin/bundle add apparition launchy capybara--group test
```

Generate test model

```
./bin/rails g rspec:model user
./bin/rails g rspec:model medium
```
