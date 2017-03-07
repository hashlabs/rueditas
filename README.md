# Rueditas

Rueditas is the base Rails API application template used at [Hash Labs](https://www.hashlabs.com)

![rueditas](http://mla-s1-p.mlstatic.com/bicicletas-halley-para-ninos-19057-playera-rueditas-rod-16-13682-MLA87487077_3161-O.jpg)

## Usage

```bash
git clone https://github.com/hashlabs/rueditas
rails new app_name -T -m rueditas/template.rb
```

## Gemfile

This template include additional gems that we use to kickstart our Rails projects. Here's a list of the gems included.

* [Sentry Raven](https://github.com/getsentry/raven-ruby) for exception notification
* [Postgres](https://github.com/ged/ruby-pg) for access to the Postgres database
* [Puma](https://github.com/puma/puma) to serve things

And development gems like:

* [Dotenv](https://github.com/bkeepers/dotenv) for loading environment variables
* [Pry Rails](https://github.com/rweng/pry-rails) for interactively exploring
  objects
* [ByeBug](https://github.com/deivid-rodriguez/byebug) for interactively
  debugging behavior
* [Bullet](https://github.com/flyerhzm/bullet) for help to kill N+1 queries and
  unused eager loading
* [Bundler Audit](https://github.com/rubysec/bundler-audit) for scanning the
  Gemfile for insecure dependencies based on published CVEs
* [Spring](https://github.com/rails/spring) for fast Rails actions via
  pre-loading

## License

Rueditas is Copyright © 2014-2017 Hash Labs. It is free software, and may be redistributed under the terms specified in the [LICENSE](/LICENSE) file.

## About Hash Labs

![hash labs logo](https://www.hashlabs.com/images/hashlabs_logo_horizontal_02.png)

Rueditas is maintained by [Hash Labs LLC](https://www.hashlabs.com)
