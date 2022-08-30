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

## Login

Generate views

```
./bin/rails g devise:views
```
