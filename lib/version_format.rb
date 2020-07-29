module VersionUtils
  def self.format(parts)
    version = []
    version = version + [parts[:major]]

    if parts[:minor] != nil
      version = version + [parts[:minor]]
    end

    if parts[:patch] != nil
      version = version + [parts[:patch]]
    end

    version = version.join(".")

    if parts[:pre_release] != nil
      version = version + "-" + parts[:pre_release]
    end

    if parts[:metadata] != nil
      version = version + "+" + parts[:metadata]
    end

    return version.force_encoding("utf-8")
  end
end
