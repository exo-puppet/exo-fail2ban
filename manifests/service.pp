# Class: fail2ban::service
#
# This class manage the fail2ban service
class fail2ban::service {
  service { 'fail2ban':
    ensure     => running,
    name       => $fail2ban::params::service_name,
    hasstatus  => true,
    hasrestart => true,
    require    => Class['fail2ban::config'],
  }
}
