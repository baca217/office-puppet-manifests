#this gives micheal scott the ability to shutdown with 2 hours notice
#also allows him to cancel the shutdown
#haven't tested thourougly
#maybe can combine all commands into 1?

user { 'root':
        ensure => 'present',
}

user { 'mscott':
        ensure => 'present',
}

sudo::conf { 'mscott_sd_1':
        content => 'mscott ALL=/usr/sbin/shutdown +[1][2-9][0-9]'
}

sudo::conf { 'mscott_sd_2':
        content => 'mscott ALL=/usr/sbin/shutdown +[2-9][0-9][0-9]'
}

sudo::conf { 'mscott_sd_3':
        content => 'mscott ALL=/usr/sbin/shutdown +[1][0-4][0-4][0-9]'
}

sudo::conf { 'mscott_sd_cancel':
        content => 'mscott ALL=/usr/sbin/shutdown -c'
}
