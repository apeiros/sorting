# encoding: utf-8

require 'sorting/convenience'

suite "Sorting" do
  test "#asc" do
    assert_equal [1,2,3], [3,1,2].sort_by { |x| asc(x) }
  end

  test "#asc with :nils_last" do
    assert_equal [1,2,3,nil], [3,nil,1,2].sort_by { |x| asc(x, :nils_last) }
  end

  test "#asc with :nils_first" do
    assert_equal [nil,1,2,3], [3,nil,1,2].sort_by { |x| asc(x, :nils_first) }
  end

  test "#asc with lazy evaluation" do
    assert_equal [1,2,3], [3,1,2].sort_by { |x| asc { x } }
  end

  test "#asc with lazy evaluation and :nils_last" do
    assert_equal [1,2,3,nil], [3,nil,1,2].sort_by { |x| asc(:nils_last) { x } }
  end

  test "#asc with lazy evaluation and :nils_first" do
    assert_equal [nil,1,2,3], [3,nil,1,2].sort_by { |x| asc(:nils_first) { x } }
  end

  test "#desc" do
    assert_equal [3,2,1], [3,1,2].sort_by { |x| desc(x) }
  end

  test "#desc with :nils_last" do
    assert_equal [3,2,1,nil], [3,nil,1,2].sort_by { |x| desc(x, :nils_last) }
  end

  test "#desc with :nils_first" do
    assert_equal [nil,3,2,1], [3,nil,1,2].sort_by { |x| desc(x, :nils_first) }
  end

  test "#desc with lazy evaluation" do
    assert_equal [3,2,1], [3,1,2].sort_by { |x| desc { x } }
  end

  test "#desc with lazy evaluation and :nils_last" do
    assert_equal [3,2,1,nil], [3,nil,1,2].sort_by { |x| desc(:nils_last) { x } }
  end

  test "#desc with lazy evaluation and :nils_first" do
    assert_equal [nil,3,2,1], [3,nil,1,2].sort_by { |x| desc(:nils_first) { x } }
  end

end
