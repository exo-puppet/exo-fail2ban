class fail2ban::configure {
	file {
		"/etc/fail2ban/jail.local" :
			ensure => present,
			owner => "root",
			group => "root",
			mode => 640,
			source => "puppet:///modules/fail2ban/jail.local",
	}
	file {
		"/etc/fail2ban/action.d" :
			ensure => directory,
			recurse => true,
			owner => root,
			group => root,
	}
	file {
		"/etc/fail2ban/filter.d" :
			ensure => directory,
			recurse => true,
			owner => root,
			group => root,
	}
	file {
		"/etc/fail2ban/filter.d/apache-w00tw00t.conf" :
			ensure => present,
			owner => root,
			group => root,
			mode => "640",
			source => "puppet:///modules/fail2ban/filter.d/apache-w00tw00t.conf",
	}
	Class['fail2ban::install'] -> Class['fail2ban::configure']
}
