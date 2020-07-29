# VersionUtils

Utils for version-strings manipulation

## Instalation

Add this line to your application's Gemfile:

```ruby
gem 'version_utils'
```

And then execute: 

```shell
bundle
```

Or install it yourself as: 

```shell
gem install verision_utils
```

## Usage

The format accepted by the library is based on semantic version specifications: [https://semver.org](https://semver.org)

**mayor**.**minor**.**patch**-*pre_release*+*metadata*

Examples:

* 2.0
* 1.2.3
* 1.3.4+22
* 2.3.4+21AF26D3
* 1.3.5-rc.1+34
* 1.3.5-alpha2
* 1.2-b1

### Compare

**VersionUtils.compare()** compares two versions.

**VersionUtils.compare(version1, version2)** returns -1 if the first version is lower than the second, 0 if they are equal, and 1 if the second is lower

```ruby
require 'version_utils'

# Compare basic version format
VersionUtils.compare "1.2.3", "1.2.3" # returns 0
VersionUtils.compare "1.3", "1.4" # returns -1
VersionUtils.compare "2.0", "1.4.4" # returns 1

# Compare pre-release version
VersionUtils.compare "1.2.3", "1.2.3-rc2" # returns -1
VersionUtils.compare "1.2.3-rc.3", "1.2.3-rc.2" # returns 1

# Version metadata is ignored
VersionUtils.compare "1.2.3+23", "1.2.3+22" # returns 0
```

### Upgrade version

**VersionUtils.upgrade_\<major | minor | patch\>()** increase the version number.

```ruby
require 'version_utils'

# Upgrade version
VersionUtils.upgrade_major("1.2.3") # returns 2.0.0
VersionUtils.upgrade_minor("1.2.3") # returns 1.3.0
VersionUtils.upgrade_patch("1.2.3") # returns 1.2.4

# Pre-release is removed after upgrade version
VersionUtils.upgrade_patch("1.2.3-rc.1") # returns 1.2.4

# Update build version (metadata) if its posible
VersionUtils.upgrade_major("1.2.3-rc.1+22", update_build_version: true) # returns 1.2.4+23
VersionUtils.upgrade_major("1.2.3-rc.1+foo", update_build_version: true) # returns 1.2.4
```

## Contributing

* If you have found a bug or if you have a feature request, please report them at this repository issues section.
* Pull requests must be made against master branch.


## LICENSE

The gem is available as open source under the terms of the [MIT License](LICENSE.txt).