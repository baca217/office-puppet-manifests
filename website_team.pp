#file for the website team
#CHANGES NEEDED:
#	(1) restart command needs location changed and command locations changed both command and daemon
#	(2) directory location needs to be changed

user { 'pbeesly':
        ensure => 'present',
        groups => 'website',
        membership => minimum,
}

user { 'kkapoor':
        ensure => 'present',
        groups => 'website',
        membership => minimum,
}

user { 'abernard':
        ensure => 'present',
        groups => 'website',
        membership => minimum,
}

group { 'website': 
        ensure => 'present', 
}

class { 'sudo': }

#EX command for website team, FIX: path to http daemon
sudo::conf { 'website':
        content => '%website machine_b= /bin/systemctl restart path/http/daemon',
}

#this is for the website team 
file { '/root/website': 
        ensure => directory, 
        owner => 'root', 
        group => 'website', 
        require => [ User['root'], Group['website'], ], 
        recurse => true, 
        mode => 2741 
}

