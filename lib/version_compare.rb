module VersionUtils


  def self.compare(v1, v2)

    v1 = self.parse(v1)
    v2 = self.parse(v2)

    compare_major = self.compare_segment(v1[:major], v2[:major])
    if compare_major != 0
      return compare_major
    end

    compare_minor = self.compare_segment(v1[:minor], v2[:minor])
    if compare_minor != 0
      return compare_minor
    end

    compare_patch = self.compare_segment(v1[:patch], v2[:patch])
    if compare_patch != 0
      return compare_patch
    end

    return self.compare_pre_releae(v1[:pre_release], v2[:pre_release])

  end

  def self.compare_segment(s1, s2)
    if s1 == nil
      return -1
    end

    if s2 == nil
      return 1
    end

    if s1 == s2
      return 0
    end

    if s1 < s2
      return -1
    end

    if s1 > s2
      return 1
    end
  end

  def self.compare_pre_releae(pr1, pr2)

    if pr1 == nil && pr2 == nil
      return 0
    end

    if pr1 == nil && pr2 != nil
      return 1
    end

    if pr1 != nil && pr2 == nil
      return -1
    end

    pr1 = pr1.gsub(".", "")
    pr2 = pr2.gsub(".", "")

    if pr1 == pr2
      return 0
    end

    if pr1 > pr2
      return 1
    end

    if pr1 < pr2
      return -1
    end
  end
end
