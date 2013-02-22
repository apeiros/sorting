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

    # Convenient
    require 'sorting/convenience'
    people.sort_by { |person| [asc(person.first_name), asc(person.last_name), desc(person.age)] }

    # Or without patching Kernel
    require 'sorting'
    people.sort_by { |person|
      [Sorting.asc(person.first_name), Sorting.asc(person.last_name), Sorting.desc(person.age)]
    }

    # Care about nil values in your data
    require 'sorting/convenience'
    people.sort_by { |person|
      [asc(person.first_name, :nils_first), asc(person.first_name, :nils_last)]
    }

    # Only care about nil values in your data
    [5,3,nil,9].sort_by { |x| x || Sorting::Bigger } # Sorting::Smaller is available too

    # Care about expensive comparison values which may not always be needed
    # assume item.expensive_value takes a lot of time to compute, but since it's the second value,
    # it might only be needed in a small number of cases.
    require 'sorting/convenience'
    items.sort_by { |item|
      [asc(item.cheap_value), asc(:nils_last) { item.expensive_value }]
    }

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
