lib_dir = File.expand_path("../../lib", __FILE__)
$:.unshift lib_dir unless $:.include?(lib_dir)
require "test/unit"
require "smart_hash_merge"
require "shoulda"

class MergeTest < Test::Unit::TestCase

  should "create nodes that do not exist in LHS" do
    lhs = {}
    rhs = { "foo" => { "bar" => "baz" } }
    assert_equal rhs, SmartHashMerge.merge(lhs, rhs)
  end

  should "merge hashes" do
    lhs = { "foo" => { "a" => 1 } }
    rhs = { "foo" => { "b" => 2 } }
    expected = { "foo" => { "a" => 1, "b" => 2 } }
    assert_equal expected, SmartHashMerge.merge(lhs, rhs)
  end

  should "replace non-collection hash values from LHS with values from RHS" do
    lhs = { "foo" => { "a" => 1 } }
    rhs = { "foo" => { "a" => 2 } }
    expected = { "foo" => { "a" => 2 } }
    assert_equal expected, SmartHashMerge.merge(lhs, rhs)
  end

  should "merge array values" do
    lhs = { "foo" => ["bar"] }
    rhs = { "foo" => ["baz"] }
    expected = { "foo" => ["bar", "baz"] }
    assert_equal expected, SmartHashMerge.merge(lhs, rhs)
  end

  should "merge LHS value with RHS array" do
    lhs = { "foo" => "bar" }
    rhs = { "foo" => ["baz"] }
    expected = { "foo" => ["bar", "baz"] }
    assert_equal expected, SmartHashMerge.merge(lhs, rhs)
  end

end
