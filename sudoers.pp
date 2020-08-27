class { 'sudo': }

user { 'mscott':
	ensure => 'present',
	groups => 'wheel',
	membership => 'minimum',
}

user { 'dschrute':
	ensure => 'present',
	groups => 'wheel',
	membership => 'minimum',
}

user { 'ebacahol':
	ensure => 'present',
	groups => 'wheel',
	membership => 'minimum',
}

sudo::conf { 'sudoers':
	content => '%wheel ALL=(ALL:ALL)	ALL',
}
