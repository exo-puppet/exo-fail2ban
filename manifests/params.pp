# Class: fail2ban::params
#
# This class manage the fail2ban parameters for different OS
class fail2ban::params {
	
	$ensure_mode = $fail2ban::lastversion ? {
		true => latest,
		default => present
	}
	info ("fail2ban ensure mode = $ensure_mode")
	

	case $::operatingsystem {
		/(Ubuntu|Debian)/: {
            $package_name       = ["fail2ban"]
            $service_name       = "fail2ban"
            $configuration_dir  = "/etc/fail2ban"
		}
		default: {
			fail ("The ${module_name} module is not supported on $::operatingsystem")
		}
	}
}
