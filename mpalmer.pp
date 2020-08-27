#puppet file for meredith
#allows her to restart vsftpd without a password, part of ftp group
#allows meredith to read and write files in /var/ftp
#had to change /var/ftp/ permissions manually, since puppet requires a script or manual change for
#	directory permissions
user { 'mpalmer':
        ensure => 'present',
        groups => 'ftp',
        membership => 'minimum',
}

user { 'root':
	ensure => 'present',
}

group { 'ftp':
        ensure => 'present',
}

class { 'sudo': }

#allows mpalmer to restart vsftpd on machine c
sudo::conf { 'ftp':
        content => '%ftp 100.64.9.3=NOPASSWD: /usr/bin/systemctl restart /usr/sbin/vsftpd',
}

#allows mpalmer to read and write files in directory /var/ftp/
file { '/var/ftp/':
        ensure => directory,
        owner => 'root',
        group => 'ftp',
        require => [ User['root'], Group['ftp'], ],
        recurse => true,
        mode => 2760,
}
