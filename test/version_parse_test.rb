require_relative '../lib/version_utils'

require 'test/unit'

class VersionParseTest < Test::Unit::TestCase

  def test_mayor_is_1
    result = VersionUtils.parse("1.2.3-rc1+22")
    assert_equal result[:major], 1
  end

  def test_mayor_is_2
    result = VersionUtils.parse("1.2.3-rc1+22")
    assert_equal result[:minor], 2
  end

  def test_mayor_is_3
    result = VersionUtils.parse("1.2.3-rc1+22")
    assert_equal result[:patch], 3
  end

  def test_pre_release_is_rc1
    result = VersionUtils.parse("1.2.3-rc1+22")
    assert_equal result[:pre_release], "rc1"
  end

  def test_metadata_is_22
    result = VersionUtils.parse("1.2.3-rc1+22")
    assert_equal result[:metadata], "22"
  end

  def test_only_segments
    result = VersionUtils.parse("1.2.3")
    assert_equal result[:major], 1
    assert_equal result[:minor], 2
    assert_equal result[:patch], 3
  end

  def test_segments_and_metadata
    result = VersionUtils.parse("1.2.3+22")
    assert_equal result[:major], 1
    assert_equal result[:minor], 2
    assert_equal result[:patch], 3
    assert_equal result[:metadata], "22"
  end

  def test_simple_major_version
    result = VersionUtils.parse("1")
    assert_equal result[:major], 1
  end


  def test_simple_major_and_minor
    result = VersionUtils.parse("1.2")
    assert_equal result[:major], 1
    assert_equal result[:minor], 2
  end
end
