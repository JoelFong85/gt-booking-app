# README

I was able to finish most of the assignment requirements, except dockerisation as I ran into issues with one of the dependencies --> Nokogiri.
In my app Nokogiri was configured to use the version for ARM64 (Mac silicon), and I ran out of time before I could fix this issue.
Hence, will need to trouble to run the below steps to get the app up and running.

### Set up dependencies
Ensure to have Ruby installed. Application was built on Ruby 3.0.0.

In the project directory, run:

```sh
gem install rails
```

followed by:
```sh
bundle install
```

### Set up DB
Run this to migrate the db:

```sh
rails db:migrate
```

Run this to seed db data:
```sh
rails db:seed
```

### Run application

```sh
rails server
```

### Testing

I have used minitests to build the test cases.
Tests files can be found in ./test

I have included tests for helpers & models.
The commands to run the tests are also included in the classes. 
Commands to run all tests are right at the top. eg.
```sh
rails test test/helpers/room_helper_test.rb 
```
Commands to run specific tests are right above the test case. eg.
```sh
rails test test/helpers/room_helper_test.rb -n test_get_room_list_returns_room_list
```