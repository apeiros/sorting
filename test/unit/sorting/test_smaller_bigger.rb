# encoding: utf-8

require 'sorting/convenience'
require 'date'

suite "Sorting" do
  suite "Smaller" do
    test "#<=>" do
      assert_equal  -1, Sorting::Smaller <=> 1
      assert_equal  -1, Sorting::Smaller <=> Time.now
      assert_equal  -1, Sorting::Smaller <=> Date.today
      assert_equal  -1, Sorting::Smaller <=> Float::INFINITY
      assert_equal  -1, Sorting::Smaller <=> "Some String"
      assert_equal  -1, Sorting::Smaller <=> ["an", "array"]
      assert_equal  -1, Sorting::Smaller <=> Object.new

      assert_equal  1, 1 <=> Sorting::Smaller
      assert_equal  1, Time.now <=> Sorting::Smaller
      assert_equal  1, Date.today <=> Sorting::Smaller
      assert_equal  1, Float::INFINITY <=> Sorting::Smaller
      assert_equal  1, "Some String" <=> Sorting::Smaller
      assert_equal  1, ["an", "array"] <=> Sorting::Smaller
    end
  end

  suite "Bigger" do
    test "#<=>" do
      assert_equal  1, Sorting::Bigger <=> 1
      assert_equal  1, Sorting::Bigger <=> Time.now
      assert_equal  1, Sorting::Bigger <=> Date.today
      assert_equal  1, Sorting::Bigger <=> Float::INFINITY
      assert_equal  1, Sorting::Bigger <=> "Some String"
      assert_equal  1, Sorting::Bigger <=> ["an", "array"]
      assert_equal  1, Sorting::Bigger <=> Object.new

      assert_equal  -1, 1 <=> Sorting::Bigger
      assert_equal  -1, Time.now <=> Sorting::Bigger
      assert_equal  -1, Date.today <=> Sorting::Bigger
      assert_equal  -1, Float::INFINITY <=> Sorting::Bigger
      assert_equal  -1, "Some String" <=> Sorting::Bigger
      assert_equal  -1, ["an", "array"] <=> Sorting::Bigger
    end
  end
end
