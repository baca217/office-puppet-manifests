#for setting up admins privileges (sudo anywhere, any command)

user { 'ebacahol' :
	ensure => 'present'
	groups => 'admins',
	membership => minimum,
}

user { 'dschrute' :
	ensure => 'present'
	groups => 'admins',
	membership => minimum,
}

class { 'sudo': }

sudo::conf { 'admins':
	content => '%admins ALL=(ALL)		ALL',
}
