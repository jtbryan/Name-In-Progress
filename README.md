# HashScrape

HashScrape is a web application designed for the purpose of allowing users the ability search for the most recent tweets associated with either a user or a hashtag. Users also have the option of creating an account to store any tweets they might find to view later. Accounts are created using ``bcrypt's`` hashing algorithm to assure passwords are stored securely.

Due to the fact this web application uses the twitter API to access tweets, this project is being left public rather than being hosted on github pages. As such, please refer to the installation section to access this application.

# Project Status

List of features planning to be added in the future:<br>
* Add more filters to search preferences
   * Allow the user to exclude retweets
   * Allow the user to search for tweets within a certain date range
* Update the UI/UX

# Project Screenshots

Home Page

![alt text](/Project/app/assets/images/home.gif)

Search page

![alt text](/Project/app/assets/images/Search_Page.PNG)

Example results of a user searching for the 100 most recent tweets containing the hashtag: "#cats"

![alt text](/Project/app/assets/images/result.PNG)

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

more information can be found here: [https://github.com/sferik/twitter]
<br>

