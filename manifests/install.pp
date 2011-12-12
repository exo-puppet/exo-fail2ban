# Class: postfix::install
#
# This class manage the installation of the postfix package
class fail2ban::install {
    package { "fail2ban" :
        name    => $fail2ban::params::package_name,
        ensure  => $fail2ban::params::ensure_mode,
        require => [ Exec ["repo-update"],],
    }
}
