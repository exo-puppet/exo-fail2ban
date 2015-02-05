################################################################################
#
#   This module manages the fail2ban service.
#
#   Tested platforms:
#    - Ubuntu 14.04
#    - Ubuntu 12.04
#    - Ubuntu 11.04
#
#
# == Parameters
#   [+lastversion+]
#       (OPTIONAL) (default: false)
#
#       this variable allow to chose if the package should always be updated to the last available version (true) or not (false)
#       (default: false)
#
#   [+ignoreip+]
#       (OPTIONAL) (default: ["127.0.0.1"])
#
#       this variable can be an array of IP addresses, CIDR masks or DNS hosts and is used as exception by fail2ban. Hosts matching
#       a value defined here cannnot be banned.  (default: ["127.0.0.1"])
#
# == Modules Dependencies
#
# [+repo+]
#   the +repo+ puppet module is needed to :
#
#   - refresh the repository before installing package (in fail2ban::install)
#
# == Examples
#
#   class { "fail2ban":
#       lastversion => true,
#       ignoreip => "127.0.0.1, 192.0.2.1/24",
#   }
#
################################################################################
class fail2ban (
  $lastversion = false,
  $ignoreip    = [
    '127.0.0.1']) {
  # parameters validation
  if ($lastversion != true) and ($lastversion != false) {
    fail('lastversion must be true or false')
  }
  include repo
  include fail2ban::params, fail2ban::install, fail2ban::config, fail2ban::service
}
