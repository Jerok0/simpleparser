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
  end
end