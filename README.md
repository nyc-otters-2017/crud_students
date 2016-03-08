# Anagram Server: The Basics

## Learning Competencies

* map the flow of data through a web application
* recognize the five HTTP methods (GET, POST, DELETE, PUT, PATCH)
* see implementation of MVC on the web.
* use important unix contextual tools (e.g. `wc`, `cat`, `man`, `grep`)
* use the database to verify changes made by the framework
* use `rake` to generate models, migrations, and to perform migration


## Summary
We're going to write a web application backed by a database.  Users will provide a word, our application will access the database to retrieve anagrams for that word, and the anagrams will be show to the user.


## Releases
### Pre-release: Intall Gems
Ensure that the gems required for the application have been installed.  From the command line, run `bundle install`.


### Release 0: Create a Model and Migration for Words
If we're going to search a database for a given word's anagrams, we'll need to store words in a database.  We need to create a database with a table in which we can store words.  We'll also want a model to represent words in Ruby.

1. Use the provided Rake tasks to create a `Word` model and a `create_words` migration (see `Rakefile`).
  ```text
  $ bundle exec rake generate:model NAME=Word
  $ bundle exec rake generate:migration NAME=create_words
  ```

2. Write the migration to [create][create_table] the `words` table. What data does the table need to store?  We'll need to store each of the words listed in the file `db/fixtures/abridged_word_list.txt`.

3. Use the provided Rake tasks to create and migrate the database.
  ```text
  $ bundle exec rake db:create
  $ bundle exec rake db:migrate
  ```


### Release 1: Import a Dictionary



We want to populate our database with a word list. This means we need two
things:

1. a source word list (preferably with one word per line)
1. a Ruby program that reads the source word list and for each line in the list
  creates a new instance of our `Word` class in the `words` table in the database

Fortunately Apple has provided a word list on every Apple machine in the file:
`/usr/share/dict/words`.  The file contains an English word on each line.

Copy `/usr/share/dict/words` into a (new!) directory in your application
directory called `db/fixtures`. We're copying the file into our application
directory because we want to make sure every developer that gets this repo can
populate their database with the _same_ information, not whatever dictionary
happens to be on _that_ machine.

We need to write some Ruby code to read in the copy of the `words` file. The
act of doing an initial population of a database is called "seeding" it.
Accordingly your application directory has a file called `db/seeds.rb` which
should be edited to use Ruby code to read in the `words` file and populate the
database.

### Release 2: Build The Form

Before we dive into constructing anagrams, let's get the form working.  Start
the application by running:

```text
$ shotgun config.ru
```
then visit [http://localhost:9393/chicken](http://localhost:9393/chicken).  You should see something like this:

<p style="text-align: center">
<img src="/screenshot.png">
</p>

Look at `app/controllers/anagrams.rb` to see how the URL parameter is passed into
your web application.  Does this make sense to you?  If not, find another
student or staff to help you understand &mdash; this is the **core** type of
interaction between a user's browser and your web application.

Now edit `app/views/anagrams/index.erb` to make it look like you want.  Feel free to add
your own CSS, remove debugging information, etc.  But make sure you understand
the flow of data from the browser to the server and back to the browser again.

### Release 3: Define a `Word#anagrams` Method

Define a method on your `Word` model like this:

```ruby
class Word < ActiveRecord::Base
  ...
  # Returns an Array of Word objects which represent anagrams of this word
  # This can and should make calls to the database
  # Try to do it in as few calls as possible, without loading every word into memory.  If you can't, that's ok.
  def anagrams
  end
  ...
end
```

You should re-use some of the logic from Anagrams 2: Generating Anagrams.  You
might think this means "re-use the `anagrams_for` method we defined there."
That's not what we mean; we mean re-use the core logic.  It should be written
in an object-oriented style and return an `Array` of `Words`, not `Strings`.

### Release 4: Display Anagrams

Edit `app/controllers/anagrams.rb` so that when you visit
`http://localhost:9393/inch`, `http://localhost:9393/snail`, etc. it
displays a nice list of anagrams for the word encoded in the URL.

It should still render the same form, so your users can ask for a new set of
anagrams.  Remember: DRY!  Small fragments of view code that are to be re-used
between views are called **partials**.

See [How do I render partials?][sinatra_partials] in
Sinatra's FAQ.

## Resources

* [Active Record: Create Table][create_table]
* [Sinatra FAQ][sinatra_partials]

[create_table]: http://api.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/SchemaStatements.html#method-i-create_table
[sinatra_partials]: http://www.sinatrarb.com/faq.html#partials
