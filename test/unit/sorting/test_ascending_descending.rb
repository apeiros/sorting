# encoding: utf-8

require 'sorting/convenience'

suite "Sorting" do
  suite "Ascending" do
    test "#initialize" do
      assert_instance_of Sorting::Ascending, Sorting::Ascending.new(0)
      assert_instance_of Sorting::Ascending, Sorting::Ascending.new(0, nil)
      assert_instance_of Sorting::Ascending, Sorting::Ascending.new(0, :nils_first)
      assert_instance_of Sorting::Ascending, Sorting::Ascending.new(0, :nils_last)
      assert_raises ArgumentError do Sorting::Ascending.new(0, :invalid) end

      assert_instance_of Sorting::Ascending, Sorting::Ascending.new { 0 }
      assert_instance_of Sorting::Ascending, Sorting::Ascending.new(nil) { 0 }
      assert_instance_of Sorting::Ascending, Sorting::Ascending.new(:nils_first) { 0 }
      assert_instance_of Sorting::Ascending, Sorting::Ascending.new(:nils_last) { 0 }
      assert_raises ArgumentError do Sorting::Ascending.new(:invalid) { 0 } end
    end

    test "#treat_nils" do
      assert_equal nil,         Sorting::Ascending.new(0).treat_nils
      assert_equal nil,         Sorting::Ascending.new(0, nil).treat_nils
      assert_equal :nils_first, Sorting::Ascending.new(0, :nils_first).treat_nils
      assert_equal :nils_last,  Sorting::Ascending.new(0, :nils_last).treat_nils
    end

    test "#nils_first?" do
      assert_equal false, Sorting::Ascending.new(0).nils_first?
      assert_equal false, Sorting::Ascending.new(0, nil).nils_first?
      assert_equal true,  Sorting::Ascending.new(0, :nils_first).nils_first?
      assert_equal false, Sorting::Ascending.new(0, :nils_last).nils_first?
    end

    test "#nils_last?" do
      assert_equal false, Sorting::Ascending.new(0).nils_last?
      assert_equal false, Sorting::Ascending.new(0, nil).nils_last?
      assert_equal false, Sorting::Ascending.new(0, :nils_first).nils_last?
      assert_equal true,  Sorting::Ascending.new(0, :nils_last).nils_last?
    end

    test "#value" do
      value = Object.new
      assert_equal value, Sorting::Ascending.new(value).value
    end

    test "#<=>" do
      assert_equal  -1, Sorting::Ascending.new(0) <=> Sorting::Ascending.new(1)
      assert_equal   0, Sorting::Ascending.new(1) <=> Sorting::Ascending.new(1)
      assert_equal   1, Sorting::Ascending.new(1) <=> Sorting::Ascending.new(0)
      assert_equal nil, Sorting::Ascending.new(0) <=> Sorting::Ascending.new(nil)
      assert_equal  -1, Sorting::Ascending.new(0, :nils_last) <=> Sorting::Ascending.new(nil)
      assert_equal   1, Sorting::Ascending.new(0, :nils_first) <=> Sorting::Ascending.new(nil)

      assert_equal  -1, Sorting::Ascending.new { 0 } <=> Sorting::Ascending.new { 1 }
      assert_equal   0, Sorting::Ascending.new { 1 } <=> Sorting::Ascending.new { 1 }
      assert_equal   1, Sorting::Ascending.new { 1 } <=> Sorting::Ascending.new { 0 }
      assert_equal nil, Sorting::Ascending.new { 0 } <=> Sorting::Ascending.new { nil }
      assert_equal  -1, Sorting::Ascending.new(:nils_last) { 0 } <=> Sorting::Ascending.new { nil }
      assert_equal   1, Sorting::Ascending.new(:nils_first) { 0 } <=> Sorting::Ascending.new { nil }
    end
  end



  suite "Descending" do
    test "#initialize" do
      assert_instance_of Sorting::Descending, Sorting::Descending.new(0)
      assert_instance_of Sorting::Descending, Sorting::Descending.new(0, nil)
      assert_instance_of Sorting::Descending, Sorting::Descending.new(0, :nils_first)
      assert_instance_of Sorting::Descending, Sorting::Descending.new(0, :nils_last)
      assert_raises ArgumentError do Sorting::Descending.new(0, :invalid) end

      assert_instance_of Sorting::Descending, Sorting::Descending.new { 0 }
      assert_instance_of Sorting::Descending, Sorting::Descending.new(nil) { 0 }
      assert_instance_of Sorting::Descending, Sorting::Descending.new(:nils_first) { 0 }
      assert_instance_of Sorting::Descending, Sorting::Descending.new(:nils_last) { 0 }
      assert_raises ArgumentError do Sorting::Descending.new(:invalid) { 0 } end
    end

    test "#treat_nils" do
      assert_equal nil,         Sorting::Descending.new(0).treat_nils
      assert_equal nil,         Sorting::Descending.new(0, nil).treat_nils
      assert_equal :nils_first, Sorting::Descending.new(0, :nils_first).treat_nils
      assert_equal :nils_last,  Sorting::Descending.new(0, :nils_last).treat_nils
    end

    test "#nils_first?" do
      assert_equal false, Sorting::Descending.new(0).nils_first?
      assert_equal false, Sorting::Descending.new(0, nil).nils_first?
      assert_equal true,  Sorting::Descending.new(0, :nils_first).nils_first?
      assert_equal false, Sorting::Descending.new(0, :nils_last).nils_first?
    end

    test "#nils_last?" do
      assert_equal false, Sorting::Descending.new(0).nils_last?
      assert_equal false, Sorting::Descending.new(0, nil).nils_last?
      assert_equal false, Sorting::Descending.new(0, :nils_first).nils_last?
      assert_equal true,  Sorting::Descending.new(0, :nils_last).nils_last?
    end

    test "#<=>" do
      assert_equal   1, Sorting::Descending.new(0) <=> Sorting::Descending.new(1)
      assert_equal   0, Sorting::Descending.new(1) <=> Sorting::Descending.new(1)
      assert_equal  -1, Sorting::Descending.new(1) <=> Sorting::Descending.new(0)
      assert_equal nil, Sorting::Descending.new(0) <=> Sorting::Descending.new(nil)
      assert_equal  -1, Sorting::Descending.new(0, :nils_last) <=> Sorting::Descending.new(nil)
      assert_equal   1, Sorting::Descending.new(0, :nils_first) <=> Sorting::Descending.new(nil)

      assert_equal   1, Sorting::Descending.new { 0 } <=> Sorting::Descending.new { 1 }
      assert_equal   0, Sorting::Descending.new { 1 } <=> Sorting::Descending.new { 1 }
      assert_equal  -1, Sorting::Descending.new { 1 } <=> Sorting::Descending.new { 0 }
      assert_equal nil, Sorting::Descending.new { 0 } <=> Sorting::Descending.new { nil }
      assert_equal  -1, Sorting::Descending.new(:nils_last) { 0 } <=> Sorting::Descending.new { nil }
      assert_equal   1, Sorting::Descending.new(:nils_first) { 0 } <=> Sorting::Descending.new { nil }
    end
  end
end
