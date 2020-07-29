module VersionUtils
  def self.upgrade_major(
      version,
      update_build_version: false)

    version = self.parse(version)

    version[:major] += 1

    if version[:minor] != nil
      version[:minor] = 0
    end

    version = self.update_patch(version)
    version = self.update_pre_release(version)
    version = self.update_metadata(version, update_build_version)

    return self.format(version)
  end

  def self.upgrade_minor(
      version,
      update_build_version: false)
    version = self.parse(version)

    version[:minor] += 1

    version = self.update_patch(version)
    version = self.update_pre_release(version)
    version = self.update_metadata(version, update_build_version)
    return self.format(version)
  end

  def self.upgrade_patch(
      version,
      update_build_version: false)
    version = self.parse(version)

    version[:patch] += 1

    version = self.update_pre_release(version)
    version = self.update_metadata(version, update_build_version)
    return self.format(version)
  end

  def self.update_patch(version)
    if version[:patch] != nil
      version[:patch] = 0
    end
    return version
  end

  def self.update_pre_release(version)
    version[:pre_release] = nil
    return version
  end

  def self.update_metadata(version, update_build_version)
    if update_build_version
      begin
        build_version = Integer(version[:metadata])
        version[:metadata] = (build_version + 1).to_s
      rescue
        version[:metadata] = nil
      end
    else
      version[:metadata] = nil
    end
    return version
  end
end
