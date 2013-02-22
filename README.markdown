README
======


Summary
-------
Helpful functionality for sorting and comparing.


Installation
------------
`gem install sorting`


Usage
-----

Sort a list of Person objects

    people.sort_by { |person| [asc(person.first_name), asc(person.last_name), desc(person.age)] }

Take a look at {file:documentation/examples.rb} for more examples.


Links
-----

* [Online API Documentation](http://rdoc.info/github/apeiros/sorting/)
* [Public Repository](https://github.com/apeiros/sorting)
* [Bug Reporting](https://github.com/apeiros/sorting/issues)
* [RubyGems Site](https://rubygems.org/gems/sorting)


License
-------

You can use this code under the {file:LICENSE.txt BSD-2-Clause License}, free of charge.
If you need a different license, please ask the author.
