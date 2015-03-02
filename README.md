# BacklogV24r

[Backlog](http://www.backlog.jp/) is an issue tracking SaaS.
This gem accesses with api based on [Backlog API Document](http://developer.nulab-inc.com/ja/docs/backlog).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'backlog_v2_4r'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install backlog_v2_4r

## Usage

```
You have got to have backlogs api key

backlog_api = BacklogApi.new(api_key: api_key_xxxxxxxxxxxx)

I recommend you use environment variables as follows

backlog_api = BacklogApi.new(api_key: ENV["API_KEY"])

# get projects
backlog_api.projects

# get spage
backlog_api.space

# search issues
backlog_api.issues({ "projectId[]" => project_id, "count" => 10 })

backlog_api.issues(params)

#  note: params based on [Backlog API Document](http://developer.nulab-inc.com/ja/docs/backlog)

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/backlog_v2_4r/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
