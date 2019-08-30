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

Each group of exercises is located on a branch. In order to access these exercises, fetch the branch (`git fetch origin controllers`, for example) and checkout out the branch (`git checkout controllers`).

Some exercises contain database migrations, so apply them with:

```
rails db:create
rails db:migrate
```

## Completing the Exercises

Each group of exercises has tests under `spec/features` and/or `spec/models`. Each test file begins with a number (ex: `1dog_spec.rb`). This number indicates the order in which you should complete the tests.

Run the tests individually with `rspec spec/models/1dog_spec.rb` for example. You can also skip tests by changing `it` blocks to `xit` which will be helpful for narrowing your focus.
