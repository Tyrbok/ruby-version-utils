require_relative '../lib/version_utils'

require 'test/unit'

class VersionCompareTest < Test::Unit::TestCase

  def test_right_var_is_minor
    result = VersionUtils.compare "2", "1"
    assert_equal result, 1
  end

  def test_left_var_is_minor
    result = VersionUtils.compare "1", "2"
    assert_equal result, -1
  end

  def test_both_versions_are_equals
    result = VersionUtils.compare "1.2.3", "1.2.3"
    assert_equal result, 0
  end

  def test_right_patch_is_lower
    result = VersionUtils.compare "1.2.5", "1.2.3"
    assert_equal result, 1
  end

  def test_right_mayor_is_lower
    result = VersionUtils.compare "2.2.5", "1.2.3"
    assert_equal result, 1
  end

  def test_left_minor_is_lower
    result = VersionUtils.compare "1.1.5", "1.2.3"
    assert_equal result, -1
  end

  def test_patch_version_is_higher
    result = VersionUtils.compare "1.2.0", "1.2"
    assert_equal result, 1
  end

  def test_ignore_metadata_build
    result = VersionUtils.compare "1.2.0+20010203", "1.2.0"
    assert_equal result, 0
  end

  def test_pre_releases_are_lower
    result = VersionUtils.compare "1.2.0-rc2", "1.2.0"
    assert_equal result, -1
  end

  def test_alpha_lower_than_rc
    result = VersionUtils.compare "1.2.0-rc2", "1.2.0-a1"
    assert_equal result, 1
  end

  def test_ignore_pre_release_dots
    result = VersionUtils.compare "1.2.0-rc2", "1.2.0-rc.2"
    assert_equal result, 0
  end
end
