# == Class: bridge_utils
#
# Manage bridge-utils with Puppet
#
# === Parameters
#
# [*ensure*]
#   Ensure if present or absent.
#   Default: present
#
# [*autoupgrade*]
#   Upgrade package automatically, if there is a newer version.
#   Default: false
#
# [*package*]
#   Name of the package.
#   Only set this, if your platform is not supported or you know,
#   what you're doing.
#   Default: auto-set, platform specific
#
# === Variables
#
#  None
#
# === Examples
#
#  class { bridge_utils: }
#
# === Authors
#
# Steffen Zieger <me@saz.sh>
#
# === Copyright
#
# Copyright 2012 Steffen Zieger
#
class bridge_utils(
  $ensure = 'present',
  $autoupgrade = false,
  $package = $bridge_utils::params::package
) inherits bridge_utils::params {

  if $ensure == 'present' {
    $package_ensure = $autoupgrade ? {
      true    => 'latest',
      default => 'installed',
    }
  } else {
    $package_ensure = 'absent'
  }

  package { $package:
    ensure => $package_ensure,
  }
}
