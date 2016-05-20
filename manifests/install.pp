# Class: postfix::install
#
# This class manage the installation of the postfix package
class fail2ban::install {
  ensure_packages ('fail2ban', { 'ensure' => $fail2ban::params::ensure_mode, 'name' => $fail2ban::params::package_name })
}
