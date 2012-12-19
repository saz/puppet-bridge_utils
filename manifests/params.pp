class bridge_utils::params {
  case $::osfamily {
    debian: {
      $package = 'bridge-utils'
    }
    default: {
      case $::operatingsystem {
        default: {
          fail("Unsupported platform: ${::osfamily}/${::operatingsystem}")
        }
      }
    }
  }
}
