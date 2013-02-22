# encoding: utf-8

begin
  require 'sorting/convenience'
rescue LoadError
  $LOAD_PATH << (p File.expand_path('../../lib', __FILE__))
  require 'sorting/convenience'
  puts "Sorting gem is not installed, using relative lib"
end


require 'pp'
Person = Struct.new(:first_name, :last_name, :age)
people = [
  Person.new('Peter', 'Pan', 15),
  Person.new('Peter', 'Parker', 15),
  Person.new('Peter', 'Pan', 23),
]
pp people.sort_by { |person| [asc(person.first_name), asc(person.last_name), desc(person.age)] }


Foo  = Struct.new(:a, :b, :c)
calc = proc { |s,x| sleep(s); x }
foos = [
  Foo.new(1,2,1),
  Foo.new(1,2,2),
  Foo.new(1,3,4),
  Foo.new(2,3,4),
]
start = Time.now
pp foos.sort_by { |x| [asc(x.a), desc(calc[0.1, x.b]), asc(calc[0.2, x.c])] }
stop = Time.now
printf "Elapsed: %.2fs\n", stop-start

start = Time.now
pp foos.sort_by { |x| [asc(x.a), desc { calc[0.1, x.b] }, asc { calc[0.2, x.c] }] }
stop = Time.now
printf "Elapsed: %.2fs\n", stop-start
