# Grape ForgeryProtection

This gem is your Rails app's payment model.

## Install

Add in your application `Gemfile`:

```rb
gem 'grape-forgery_protection'
```

## Release

To release a new version, update the `CHANGELOG.md` and change the version
number in `lib/grape/forgery_protection/version.rb`.

Then, the following command will add these two files, commit, tag with the
version and push to github:

```sh
$ rake grape-forgery_protection_release
```

Finally, upload the new `pkg/grape-forgery_protection-*.gem` file to rubygems.
