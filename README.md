# Rails Exercises

This collection of exercises is for Turing students to practice Ruby on Rails concepts in isolation.

## Setup

1. Clone this repository
1. Run `bundle` from the command line

### Exercises Setup

Currently, these exercises are included in this repo:

* controllers
* models
* routes

Each group of exercises is located on a branch. In order to access these exercises, checkout out the branch (`git checkout controllers`). Note, if you list your branches using `git branch`, you will not see the branches listed at first. That's to be expected! You will still be able to check them out. Once you check out a branch, it will appear in your list of branches.

When switching between exercises on different branches, you may need to commit or stash your changes in order to checkout a new exercise branch. Don't be afraid to commit! Your changes will only be saved locally and will not affect the exercises for other students.

Some exercises contain database migrations, so apply them with:

```
rails db:create
rails db:migrate
```

If you get a message saying the database already exists when running `rails db:create`, first drop the database with `rails db:drop`.

## Completing the Exercises

Each group of exercises has tests under `spec/features` and/or `spec/models`. Each test file begins with a number (ex: `1dog_spec.rb`). This number indicates the order in which you should complete the tests.

Run the tests individually with `rspec spec/models/1dog_spec.rb` for example. You can also skip tests by changing `it` blocks to `xit` which will be helpful for narrowing your focus. Additionally, you can run a specific test with `rspec spec/models/1dog_spec.rb:xyz` where `xyz` refers to the line number in the test file where the `it` is located.

## Contributing

If you find any bugs or have suggestions, we'd love to hear them! You can email `brian@turing.io` or slack `@Brian Zanti` in the Turing Slack Workspace.
