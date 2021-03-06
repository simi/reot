require 'helper'

class TestReot < MiniTest::Unit::TestCase
  def setup
    File.delete('test/fonts/Metalista.eot') if File.exists?("test/fonts/Metalista.eot")
  end

  def test_reot_converts_ttf_to_eot
    assert Reot.convert!("test/fonts/Metalista.ttf", "test/fonts/Metalista.eot")
    assert_equal 29604, File.size("test/fonts/Metalista.eot")
  end

  def test_reot_too_many_files
    510.times {|i|
      assert Reot.convert!("test/fonts/Metalista.ttf", "test/fonts/Metalista.eot")
    }
  end

  def test_returns_false_for_bad_file_path
    assert !Reot.convert!("un/ex/isting/path.ttf", "please/here.eot")
  end
end
