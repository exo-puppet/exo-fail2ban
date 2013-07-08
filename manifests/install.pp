# Class: postfix::install
#
# This class manage the installation of the postfix package
class fail2ban::install {
  package { 'fail2ban':
    ensure  => $fail2ban::params::ensure_mode,
    name    => $fail2ban::params::package_name,
    require => [
      Exec['repo-update'],],
  }
}
