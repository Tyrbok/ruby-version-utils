require_relative '../lib/version_utils'

require 'test/unit'

class VersionManipulationMinorTest < Test::Unit::TestCase

  def test_add_minor_reset_values
    result = VersionUtils.upgrade_minor("1.2.3")
    assert_equal result, "1.3.0"
  end

  def test_add_minor_remove_pre_release
    result = VersionUtils.upgrade_minor("1.2.3-rc.1")
    assert_equal result, "1.3.0"
  end

  def test_add_minor_ignore_metadata
    result = VersionUtils.upgrade_minor("1.2.3+22")
    assert_equal result, "1.3.0"
    result = VersionUtils.upgrade_minor("1.2.3-rc.1+22")
    assert_equal result, "1.3.0"
  end

  def test_patch_update_build_version
    result = VersionUtils.upgrade_minor(
        "1.2.3-rc.1+22",
        update_build_version: true)
    assert_equal result, "1.3.0+23"
  end

  def test_patch_ignore_build_update_on_error
    result = VersionUtils.upgrade_minor(
        "1.2.3-rc.1+foo",
        update_build_version: true)
    assert_equal result, "1.3.0"
  end
end
