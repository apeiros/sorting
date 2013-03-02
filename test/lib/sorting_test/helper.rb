# encoding: utf-8

require 'stringio'
require 'yaml'
require 'test/unit/assertions'
require 'sorting_test/assertions'


module TestSuite
  attr_accessor :name
end

module Kernel
  def suite(name, &block)
    klass = Class.new(Test::Unit::TestCase)
    klass.extend TestSuite
    klass.name = "Suite #{name}"
    klass.class_eval(&block)

    klass
  end
  module_function :suite
end

class Test::Unit::TestCase
  def self.suite(name, &block)
    klass = Class.new(Test::Unit::TestCase)
    klass.extend TestSuite
    klass.name = "#{self.name} #{name}"
    klass.class_eval(&block)

    klass
  end

  def self.test(desc, &impl)
    define_method("test #{desc}", &impl)
  end

  def capture_stdout
    captured  = StringIO.new
    $stdout   = captured
    yield
    captured.string
  ensure
    $stdout = STDOUT
  end
end
