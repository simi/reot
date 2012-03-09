require 'helper'

class TestReot < MiniTest::Unit::TestCase
  def setup
    File.delete('test/fonts/Metalista.ttf.eot') if File.exists?("test/fonts/Metalista.ttf.eot")
  end

  def test_reot_converts_ttf_to_eot
    assert Reot.convert!("test/fonts/Metalista.ttf")
    assert_equal 28672, File.size("test/fonts/Metalista.ttf.eot")
  end

  def test_returns_false_for_bad_file_path
    assert !Reot.convert!("un/ex/isting/path.ttf")
    assert !File.exists?("test/fonts/Metalista.ttf.eot")
  end
end
