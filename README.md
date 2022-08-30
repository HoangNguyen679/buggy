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
