# encoding: utf-8

require 'sorting/convenience'

suite "File sorting/convenience" do
  test "Kernel#asc" do
    assert_instance_of Sorting::Ascending, asc(0), "Kernel#asc is present"
    assert_raises NoMethodError, "Kernel#asc is private" do Object.new.asc(0) end
  end

  test "Kernel::asc" do
    assert_instance_of Sorting::Ascending, Kernel.asc(0), "Kernel::asc is present"
  end

  test "Sorting#asc" do
    obj = Object.new.tap { |o| o.extend Sorting }
    assert_instance_of Sorting::Ascending, obj.send(:asc, 0), "Sorting#asc is present" # bad test, since Kernel#asc exists too :-/
    assert_raises NoMethodError, "Sorting#asc is private" do obj.asc(0) end
  end

  test "Sorting::asc" do
    assert_instance_of Sorting::Ascending, Sorting.asc(0), "Sorting::asc is present"
  end

  test "Sorting::Helpers#asc" do
    obj = Object.new.tap { |o| o.extend Sorting::Helpers }
    assert_instance_of Sorting::Ascending, obj.send(:asc, 0), "Sorting#asc is present" # bad test, since Kernel#asc exists too :-/
    assert_raises NoMethodError, "Sorting::Helpers#asc is private" do obj.asc(0) end
  end



  test "Kernel#desc" do
    assert_instance_of Sorting::Descending, desc(0), "Kernel#desc is present"
    assert_raises NoMethodError, "Kernel#desc is private" do Object.new.desc(0) end
  end

  test "Kernel::desc" do
    assert_instance_of Sorting::Descending, Kernel.desc(0), "Kernel::desc is present"
  end

  test "Sorting#desc" do
    obj = Object.new.tap { |o| o.extend Sorting }
    assert_instance_of Sorting::Descending, obj.send(:desc, 0), "Sorting#desc is present" # bad test, since Kernel#desc exists too :-/
    assert_raises NoMethodError, "Sorting#desc is private" do obj.desc(0) end
  end

  test "Sorting::desc" do
    assert_instance_of Sorting::Descending, Sorting.desc(0), "Sorting::desc is present"
  end

  test "Sorting::Helpers#desc" do
    obj = Object.new.tap { |o| o.extend Sorting::Helpers }
    assert_instance_of Sorting::Descending, obj.send(:desc, 0), "Sorting#desc is present" # bad test, since Kernel#desc exists too :-/
    assert_raises NoMethodError, "Sorting::Helpers#desc is private" do obj.desc(0) end
  end
end
