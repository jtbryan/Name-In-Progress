# HashScrape

This is a website designed using Ruby on Rails to allow users to search for tweets correlating to certain users or certain hashtags. 

# Project Status

This project is currently in development. 

List of current features being added:<br>
* User registration
* User login
* User can store tweets
* Delete account
* Add more filters to search preferences
* Update the UI/UX

# Project Screenshots

``In Progress``

# Installation/Dependencies

### <b>List of Dependencies used</b>

* ``gem install twitter`` - [https://github.com/sferik/twitter]
    * Documentation Associated with this dependency - [https://www.rubydoc.info/gems/twitter/Twitter]
* ``gem install bcrypt`` - [https://github.com/codahale/bcrypt-ruby]
    * Documentation Associated with this dependency - [https://www.rubydoc.info/gems/bcrypt-ruby/3.1.5]

### <b>Installation</b>

To run this website, perform the following steps:
* Assure that you have ruby/rails installed successfully on your machine
    * Document for installation can be found here - [https://www.tutorialspoint.com/ruby-on-rails/rails-installation.htm]
* After ruby/rails is installed correctly and you have cloned the directory, type ``cd Project`` at the top level of this directory in a terminal of your choice.
* Once inside the ``Project`` folder type the following commands:
    * ``bundle install``
    * ``rails db:migrate``
    * ``rails server``
* If you were able to perform the previous commands without any issues, you should now be able to view the website on any browser of your choosing. Simply type ``localhost:3000`` into the search bar.

### <b>Registration</b>

To properly use this website, it is required that you obtain a set of Consumer API keys by registering this app on -[https://developer.twitter.com/en] as it is required for the twitter API.

After obtaining this set of keys, you can then add a file to the path ``Project/config/initializer/file_name.rb`` containing the following information: 

```
config = {
  consumer_key:    "YOUR_CONSUMER_KEY",
  consumer_secret: "YOUR_CONSUMER_SECRET",
}

client = Twitter::REST::Client.new(config)
```

more information regarding this can be found here: [https://github.com/sferik/twitter]
<br>

