# Technical task: Zoo management (no database)

## About

Current solution kind of emulates a database.
All the animals are stored as hashes in `DB` array.
`Animal` class uses metaprogramming to accomplish method chaining, and query results are available in `@result` attribute.
Metaprogramming allows to account for new animal species or integer attributes, so that if we add an `eye_count` attribute we could do this:

```ruby
# Looking for spiders
Animal.eye_count_greater_than(3)
```

## Usage

```sh
ruby main.rb
```

Upon executing the command, you will be presented with default `pry` prompt.
`Animal` class is accessible and has all the methods needed

