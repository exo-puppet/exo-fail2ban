# Class: fail2ban::config
#
# This class manage the fail2ban configuration
class fail2ban::config {
  file { $fail2ban::params::configuration_dir:
    ensure  => directory,
    owner   => root,
    group   => root,
    mode    => '0755',
    require => Class['fail2ban::install'],
  }

  concat { "${fail2ban::params::configuration_dir}/jail.local":
    ensure => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    require => [
      Class['fail2ban::install'],
      File[$fail2ban::params::configuration_dir]],
    notify  => Class['fail2ban::service'],
  }

  concat::fragment { 'global' :
    target  => "${fail2ban::params::configuration_dir}/jail.local",
    content => template("fail2ban/${fail2ban::params::jail_template}"),
    order   => 0,
  }

  file { "${fail2ban::params::configuration_dir}/action.d":
    ensure  => directory,
    recurse => true,
    owner   => root,
    group   => root,
    require => [
      Class['fail2ban::install'],
      File[$fail2ban::params::configuration_dir]],
  }

  file { "${fail2ban::params::configuration_dir}/filter.d":
    ensure  => directory,
    recurse => true,
    owner   => root,
    group   => root,
    require => [
      Class['fail2ban::install'],
      File[$fail2ban::params::configuration_dir]],
  }

  file { "${fail2ban::params::configuration_dir}/filter.d/apache-w00tw00t.conf":
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '640',
    source  => 'puppet:///modules/fail2ban/filter.d/apache-w00tw00t.conf',
    require => [
      Class['fail2ban::install'],
      File["${fail2ban::params::configuration_dir}/filter.d"]],
    notify  => Class['fail2ban::service'],
  }

  file { "${fail2ban::params::configuration_dir}/filter.d/apache-badreq.conf":
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '640',
    source  => 'puppet:///modules/fail2ban/filter.d/apache-badreq.conf',
    require => [
      Class['fail2ban::install'],
      File["${fail2ban::params::configuration_dir}/filter.d"]],
    notify  => Class['fail2ban::service'],
  }
}
