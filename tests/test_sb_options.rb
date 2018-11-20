require 'test/unit'
require './src/sb_options'

class TestSoulBreakSelector < Test::Unit::TestCase
  test "get_selected should return burst" do
    sbselector = SoulBreakSelector.new('burst')
    assert_equal(sbselector.get_selected, 'burst')
  end

  test "get_suffix should return relative url of burst soulbreak" do
    sbselector = SoulBreakSelector.new('burst')
    assert_equal(sbselector.get_suffix, '/game/951/wiki/Soul%20Break%20List_Burst%20Soul%20Break')
  end

  test "should return default if given soulbreak does not exist" do
    sbselector = SoulBreakSelector.new('asd')
    assert_equal(sbselector.get_selected, 'default')
  end
end
