module VersionUtils
  def self.parse(version)

    result = {}

    if version.split("+").length > 1
      metadata = version.split("+")[1]
      result[:metadata] = metadata
      version = version.split("+")[0]
    end

    if version.split("-").length > 1
      part_post_segments = version.split("-")[1]
      pre_release = part_post_segments.split("+")[0]
      result[:pre_release] = pre_release
      version = version.split("-")[0]

    end

    segments = version.split(".")

    result[:major] = Integer(segments[0])

    if segments.length > 1
      result[:minor] = Integer(segments[1])
    else
      result[:minor] = nil
    end

    if segments.length > 2
      result[:patch] = Integer(segments[2])
    else
      result[:patch] = nil
    end

    return result
  end
end