require_relative '../lib/version_utils'

require 'test/unit'

class VersionManipulationMinorTest < Test::Unit::TestCase

  def test_add_patch_reset_values
    result = VersionUtils.upgrade_patch("1.2.3")
    assert_equal result, "1.2.4"
  end

  def test_add_patch_remove_pre_release
    result = VersionUtils.upgrade_patch("1.2.3-rc.1")
    assert_equal result, "1.2.4"
  end

  def test_add_patch_ignore_metadata
    result = VersionUtils.upgrade_patch("1.2.3+22")
    assert_equal result, "1.2.4"
    result = VersionUtils.upgrade_patch("1.2.3-rc.1+22")
    assert_equal result, "1.2.4"
  end

  def test_update_build_version
    result = VersionUtils.upgrade_patch(
        "1.2.3-rc.1+22",
        update_build_version: true)
    assert_equal result, "1.2.4+23"
  end

  def test_ignore_build_update_on_error
    result = VersionUtils.upgrade_patch(
        "1.2.3-rc.1+foo",
        update_build_version: true)
    assert_equal result, "1.2.4"
  end
end
