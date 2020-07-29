require_relative '../lib/version_utils'

require 'test/unit'

class VersionFormatTest < Test::Unit::TestCase

  def test_all_segments
    result = VersionUtils.format(
        {
            :major => 1,
            :minor => 2,
            :patch => 3
        })
    assert_equal result, "1.2.3"
  end

  def test_only_with_major
    result = VersionUtils.format(
        {
            :major => 1,
        })
    assert_equal result, "1"
  end

  def test_with_major_and_minor
    result = VersionUtils.format(
        {
            :major => 1,
            :minor => 2,
        })
    assert_equal result, "1.2"
  end

  def test_append_pre_release
    result = VersionUtils.format(
        {
            :major => 1,
            :minor => 2,
            :pre_release => "rc.2"
        })
    assert_equal result, "1.2-rc.2"
  end

  def test_append_pre_release_and_md
    result = VersionUtils.format(
        {
            :major => 1,
            :minor => 2,
            :pre_release => "rc.2",
            :metadata => "22"
        })
    assert_equal result, "1.2-rc.2+22"
  end

  def test_append_metadata
    result = VersionUtils.format(
        {
            :major => 1,
            :minor => 2,
            :metadata => "22"
        })
    assert_equal result, "1.2+22"
  end

end
