require 'test/unit'
require_relative '../brainfuck.rb'

class Tester < Test::Unit::TestCase
  def test1
    mybrain = Brainfuck.new
    mybrain.newprogram(",.+.+.", "a")
    assert_equal(mybrain.parse, "abc")
    mybrain.newprogram("+++[->,++.<]", "abc")
    assert_equal(mybrain.parse, "cde")
    mybrain.newprogram("++++++[->,.<]asdffsdfasdfsdfasdfasd", "abcdef")
    assert_equal(mybrain.parse, "abcdef")
    mybrain.newprogram("++++++++++[->,+++.<]", "abcdefghij")
    assert_equal(mybrain.parse, "defghijklm")
    mybrain.from_file("~/my/mybrain.b")
    mybrain.set_input("abcdefghij")
    assert_equal(mybrain.parse, "defghijklm")
  end
end